import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:zid/screens/produits/nosProduits.dart';

class AfficherProduits extends StatefulWidget {
  String uid;
  AfficherProduits({required this.uid});
  State<StatefulWidget> createState() => AfficherProduitsState(uid: this.uid);
}

class AfficherProduitsState extends State<AfficherProduits> {
  String uid;
  AfficherProduitsState({required this.uid});
  CollectionReference products =
      FirebaseFirestore.instance.collection('products');
  List<String> productsID = [
    "6M0mzdg52Wbr8bgR533B",
    "Cj86NqxvEDbC4Tp2emBA",
    "nMisolzNVKDPSCAArsAP"
  ];

  FirebaseFirestore? _instance;

  Stream<QuerySnapshot> readItems() {
    CollectionReference notesItemCollection =
        _instance!.doc("nMisolzNVKDPSCAArsAP").collection('products');

    return notesItemCollection.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(children: [
                  //------------------------------
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .doc('6M0mzdg52Wbr8bgR533B')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return new Text("Loading");
                        }
                        DocumentSnapshot<Object?> documentData =
                            snapshot.data as DocumentSnapshot;
                        //return new Text(documentData['avancement'].toString());
                        return NosProduit(
                          uid: uid,
                          productID: productsID[0],
                          imageProduit: 'assets/smartWatch.png',
                          theColor: Colors.yellow,
                          vipOrNot: 'assets/Groupe 484@1X.png',
                          date: documentData['date'],
                          avancement: documentData['avancement'],
                          nomProduit: "HUAWEI SMART WATCH GT2",
                        );
                      }),

                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .doc('Cj86NqxvEDbC4Tp2emBA')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return new Text("Loading");
                        }
                        DocumentSnapshot<Object?> documentData =
                            snapshot.data as DocumentSnapshot;
                        //return new Text(documentData['avancement'].toString());
                        return NosProduit(
                          uid: uid,
                          productID: productsID[1],
                          imageProduit: 'assets/modifiedphone.png',
                          theColor: Colors.white,
                          vipOrNot: 'assets/Groupe.png',
                          date: documentData['date'],
                          avancement: documentData['avancement'],
                          nomProduit: "REDMI 7A BLACK",
                        );
                      }),

                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('products')
                          .doc('nMisolzNVKDPSCAArsAP')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return new Text("Loading");
                        }
                        DocumentSnapshot<Object?> documentData =
                            snapshot.data as DocumentSnapshot;
                        //return new Text(documentData['avancement'].toString());
                        return NosProduit(
                          uid: uid,
                          productID: productsID[2],
                          imageProduit: 'assets/smartWatch.png',
                          theColor: Colors.white,
                          vipOrNot: 'assets/Groupe.png',
                          date: documentData['date'],
                          avancement: documentData['avancement'],
                          nomProduit: "HUAWEI SMART WATCH GT2",
                        );
                      }),

                  //------------------------------
                ]))));
  }
}
