import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zid/model/Products.dart';
import 'package:zid/model/Users.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      String firstName,
      String secondName,
      String email,
      String password,
      int numTel,
      String region,
      String pseudo,
      List<Products> listEncheres,
      List<Products> listfavoris) async {
    return await usersCollection.doc(uid).set({
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
      'password': password,
      'numTel': numTel,
      'region': region,
      'pseudo': pseudo,
      'listEncheres': listEncheres,
      'listfavoris': listfavoris
    });
  }

  Future updateMontant(RxInt montant) async {
    return await usersCollection
        .doc(uid)
        .update({'montant': montant.toString()});
  }

  Future updateAvancement(String productsID, String avancement) async {
    CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

    return await productsCollection
        .doc(productsID)
        .update({'avancement': avancement});
  }

  Future updateEncheres(String productID, String nomProduit,
      String imageProduit, String avancement, String date) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return await users.doc(uid).update({
      "encheres": FieldValue.arrayUnion([
        {
          "productID": productID,
          "imageProduit": imageProduit.toString(),
          'nomProduit': nomProduit.toString(),
          "date": date.toString(),
          "avancement": avancement.toString(),
        }
      ])
    });
  }

  void updateEnCours(String imageProduit, String nomProduit) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return await users.doc(uid).update({
      "enCours": FieldValue.arrayUnion([
        {"imageProduit": imageProduit, "nomProduit": nomProduit}
      ])
    });
  }

  void encher(String valeur, String valeurEnCours) async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    return await products.doc("nMisolzNVKDPSCAArsAP").update({
      "prixEnCours": (double.parse(valeur) + double.parse(valeurEnCours))
          .toStringAsFixed(1)
    });
  }

  void modifierJeton(String nbreJetons) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return await users
        .doc(uid)
        .update({"nombreJetons": (int.parse(nbreJetons) - 1).toString()});
  }

  void updateNbreJetonsMontant(
      int prix, int nbrePacket, String nombreJetons, String montant) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return await users.doc(uid).update({
      "nombreJetons": (nbrePacket + int.parse(nombreJetons)).toString(),
      "montant": (int.parse(montant) - prix).toString()
    });
  }

  void terimerEnchere() async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');

    return await products
        .doc("nMisolzNVKDPSCAArsAP")
        .update({"estTermine": true});
  }

  void addToPileEnchere(
      String prixEnCours, String prenom, String nom, String currentDate) async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    return await products.doc("nMisolzNVKDPSCAArsAP").update({
      "pileEnchere": FieldValue.arrayUnion([
        {
          "prixEnCours": prixEnCours,
          "nom": nom,
          "prenom": prenom,
          "currentDate": currentDate
        }
      ])
    });
  }

  void termine(String nomProduit, String imageProduit, String nomGagnant,
      String prenomGagnant, String prixFinal) async {
    CollectionReference termine =
        FirebaseFirestore.instance.collection('termine');
    termine.add({
      "nomProduit": nomProduit,
      "imageProduit": imageProduit,
      "nomGagnant": nomGagnant,
      "prenomGagnant": prenomGagnant,
      "prixFinal": prixFinal
    });
  }
}
