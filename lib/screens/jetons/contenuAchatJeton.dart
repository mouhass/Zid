import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zid/screens/jetons/jeton.dart';
import 'package:zid/screens/profile/monProfile.dart';

class ContenuAchatJeton extends StatefulWidget {
  String uid;
  ContenuAchatJeton({required this.uid});
  State<StatefulWidget> createState() => ContenuAchatJetonState(uid: uid);
}

class ContenuAchatJetonState extends State<ContenuAchatJeton> {
  String uid;
  ContenuAchatJetonState({required this.uid});
  List userData = [];
  final CollectionReference userbaseRef =
      FirebaseFirestore.instance.collection('users');
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await userbaseRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "nom": doc["firstName"],
            "prenom": doc["secondName"]
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
            userData = value;
          }));
    });
    int idUser = 0;
    for (int i = 0; i < userData.length; i++) {
      if (userData[i]['id'] == uid) {
        idUser = i;
      }
    }

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image(image: AssetImage('assets/Logo@1X.png')),
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(width: 10),
                Text("Achat de jetons",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(width: 0)
              ]),
              SizedBox(
                height: 20,
              ),

              Jeton(
                  uid: uid,
                  theImage: 'assets/PACK 50 CLICS.png',
                  couleurDuPrix: Colors.white,
                  myColor: Color(0XFF0E214D),
                  prix: 100,
                  vip: 'assets/vip.png',
                  nombrePacket: 50),
              //la fin du premier jeton
              //debut du second jeton
              SizedBox(
                height: 20,
              ),
              Jeton(
                  uid: uid,
                  theImage: 'assets/PACK 100 CLICS.png',
                  couleurDuPrix: Colors.white,
                  myColor: Color(0XFF0E214D),
                  prix: 200,
                  vip: 'assets/vip.png',
                  nombrePacket: 100),
              //fin du seond
              //debut du 3ème
              SizedBox(
                height: 20,
              ),
              Jeton(
                  uid: uid,
                  theImage: 'assets/PACK 5 CLICS.png',
                  couleurDuPrix: Colors.black,
                  myColor: Color(0XFFD9D9D9),
                  prix: 7,
                  vip: 'assets/cc.png',
                  nombrePacket: 5),
              //fin du 3ème

              //debut 5ème
              SizedBox(
                height: 20,
              ),
              Jeton(
                  uid: uid,
                  theImage: 'assets/PACK 15 CLICS.png',
                  couleurDuPrix: Colors.black,
                  myColor: Color(0XFFD9D9D9),
                  prix: 19,
                  vip: 'assets/cc.png',
                  nombrePacket: 15),
              //debut 6ème
              SizedBox(
                height: 20,
              ),
              Jeton(
                  uid: uid,
                  theImage: 'assets/PACK 20 CLICS.png',
                  couleurDuPrix: Colors.black,
                  myColor: Color(0XFFD9D9D9),
                  prix: 25,
                  vip: 'assets/cc.png',
                  nombrePacket: 20),
              //debut 7ème
              SizedBox(
                height: 20,
              ),
              Jeton(
                  uid: uid,
                  theImage: 'assets/PACK 25 CLICS.png',
                  couleurDuPrix: Colors.black,
                  myColor: Color(0XFFD9D9D9),
                  prix: 30,
                  vip: 'assets/cc.png',
                  nombrePacket: 25),
            ],
          )),
        ));
  }
}
