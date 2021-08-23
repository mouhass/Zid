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

  Future updateAvancement(String productsID) async {
    CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');

    return await productsCollection
        .doc(productsID)
        .update({'avancement': '67'});
  }

  // Future updateEncheres(String productID) async {
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //   return await users.doc
  // }

  Future updateEncheres(String productID, String nomProduit,
      String imageProduit, String avancement, String date) async {
    Users user = Users(
        UserFirstName: "UserFirstName",
        UserLastName: "UserLastName",
        region: "region",
        email: "email",
        password: "password",
        numeroTel: 0,
        pseudo: "pseudo",
        listEncheres: [],
        listFavoris: []);
    return await usersCollection.doc(uid).update({
      "encheres": FieldValue.arrayUnion([
        user.encheresItems(imageProduit.toString(), nomProduit.toString(),
            date.toString(), avancement.toString())
      ])
    }).then((_) {
      print('Transaction  committed.');
    });
  }
}
