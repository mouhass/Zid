import 'package:flutter/material.dart';
import 'package:zid/screens/home/produitFini.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProduitsTermines extends StatefulWidget {
  String uid;
  ProduitsTermines({required this.uid});
  @override
  termine createState() => termine(uid: uid);
}

final CollectionReference databaseRef =
    FirebaseFirestore.instance.collection('termine');

List docs = [];
Future<List> readData() async {
  QuerySnapshot querySnapshot;
  List docs = [];
  try {
    querySnapshot = await databaseRef.get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs.toList()) {
        Map a = {
          "nomProduit": doc['nomProduit'],
          "imageProduit": doc['imageProduit'],
          "nomGagnant": doc['nomGagnant'],
          "prenomGagnant": doc["prenomGagnant"],
          "prixFinal": doc["prixFinal"]
        };
        docs.add(a);
      }
      return docs;
    }
    return docs;
  } catch (e) {
    return docs;
  }
}

class termine extends State<ProduitsTermines> {
  String uid;
  termine({required this.uid});

  @override
  Widget build(BuildContext context) {
    setState(() {
      readData().then((value) => setState(() {
            docs = value;
          }));
    });
    return SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(children: [
              Text(docs.toString()),
              ProduitFini(
                imageProduit:
                    'assets/JBL_Flip5_Product Photo_Hero_Ocean Blue@1X.png',
                nomProduit: "JBL FLIP4",
                quiRemporte: "Zizou2001",
              ),
              ProduitFini(
                imageProduit: 'assets/smartWatch.png',
                nomProduit: "HUAWEI SMART WATCH GT2",
                quiRemporte: "Foulen",
              ),
              ProduitFini(
                imageProduit:
                    'assets/JBL_Flip5_Product Photo_Hero_Ocean Blue@1X.png',
                nomProduit: "JBL FLIP4",
                quiRemporte: "Zizou2001",
              ),
            ])));
  }
}
