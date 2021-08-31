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
  // CollectionReference products =
  //     FirebaseFirestore.instance.collection('products');
  // List<String> productsID = [
  //   "6M0mzdg52Wbr8bgR533B",
  //   "Cj86NqxvEDbC4Tp2emBA",
  //   "nMisolzNVKDPSCAArsAP"
  // ];

  // FirebaseFirestore? _instance;

  // Stream<QuerySnapshot> readItems() {
  //   CollectionReference notesItemCollection =
  //       _instance!.doc("nMisolzNVKDPSCAArsAP").collection('products');

  //   return notesItemCollection.snapshots();
  // }

  List docs = [];
  final CollectionReference databaseRef =
      FirebaseFirestore.instance.collection('products');
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await databaseRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "productID": doc.id,
            "color": doc['theColors'],
            "nomProduit": doc['nomProduit'],
            "imageProduit": doc['imageProduit'],
            "avancement": doc["avancement"],
            "date": doc['date']
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

  @override
  Widget build(BuildContext context) {
    setState(() {
      read().then((value) => setState(() {
            docs = value;
          }));
    });
    return SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: Column(children: [
                  for (int i = 0; i < docs.length; i++)
                    StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('products')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return new Text("Loading");
                          }

                          Color otherColor = Colors.red;
                          //return new Text(documentData['avancement'].toString());
                          return NosProduit(
                            uid: uid,
                            productID: docs[i]['productID'],
                            imageProduit: docs[i]['imageProduit'],
                            theColor: Color(int.parse(
                                docs[i]['color'].split('0x')[1],
                                radix: 16)),
                            vipOrNot: 'assets/Groupe 484@1X.png',
                            date: docs[i]['date'],
                            avancement: docs[i]['avancement'],
                            nomProduit: docs[i]['nomProduit'],
                          );
                        }),

                  //------------------------------
                ]))));
  }
}
