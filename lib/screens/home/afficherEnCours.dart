import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zid/screens/home/enCours.dart';
import 'package:zid/services/database.dart';

class AffichageEnCours extends StatefulWidget {
  String uid;
  AffichageEnCours({required this.uid});
  State<StatefulWidget> createState() => AffichageEnCoursState(uid: this.uid);
}

class AffichageEnCoursState extends State<AffichageEnCours> {
  String uid;
  AffichageEnCoursState({required this.uid});
  void addEnCours(String imageProduit, String nomProduit) {
    DatabaseService ds = DatabaseService(uid: uid);
    ds.updateEnCours(imageProduit, nomProduit);
  }

  List userData = [];
  final CollectionReference users =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference products =
      FirebaseFirestore.instance.collection('Products');

  Future<List> readUsers() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await users.get();
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
      readUsers().then((value) => setState(() {
            userData = value;
          }));
    });

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        for (int i = 0; i < userData.length; i++)
          if (userData[i]['id'] == uid)
            for (int j = 0; j < userData[i]['enCours'].length; j++)
              ProduitsEnCours(
                  uid: uid,
                  imageProduit:
                      userData[i]['enCours'][j]['imageProduit'].toString(),
                  nomProduit:
                      userData[i]['enCours'][j]['nomProduit'].toString(),
                  date: userData[i]['enCours'][j]['date'].toString())
      ]),
    ));
  }
}
