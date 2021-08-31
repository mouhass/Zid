import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zid/screens/home/enCours.dart';

class AffichageEnCours extends StatefulWidget {
  String uid;
  AffichageEnCours({required this.uid});
  State<StatefulWidget> createState() => AffichageEnCoursState(uid: this.uid);
}

class AffichageEnCoursState extends State<AffichageEnCours> {
  String uid;
  AffichageEnCoursState({required this.uid});
  List docs = [];
  final CollectionReference databaseRef =
      FirebaseFirestore.instance.collection('users');
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await databaseRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "enCours": doc['enCours'],
            "encheres": doc['encheres']
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
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        for (int i = 0; i < docs.length; i++)
          if (docs[i]['id'] == uid)
            for (int j = 0; j < docs[i]['enCours'].length; j++)
              ProduitsEnCours(
                  uid: uid,
                  imageProduit:
                      docs[i]['enCours'][j]['imageProduit'].toString(),
                  nomProduit: docs[i]['enCours'][j]['nomProduit'].toString(),
                  date: docs[i]['enCours'][j]['date'].toString())
      ]),
    ));
  }
}
