import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zid/screens/Autres/ModifierMesInfos.dart';
import 'package:zid/screens/home/secondScreen.dart';
import 'package:zid/screens/profile/sinscrire.dart';
import 'package:zid/screens/profile/seConnecter.dart';
import 'package:zid/services/authentification.dart';
import 'package:zid/test.dart';
import 'package:zid/testRegistration.dart';

class MonProfile extends StatefulWidget {
  String uid;
  String nom;
  String prenom;
  MonProfile({required this.uid, required this.nom, required this.prenom});
  State<StatefulWidget> createState() =>
      MonProfileState(uid: uid, nom: nom, prenom: prenom);
}

class MonProfileState extends State<MonProfile> {
  String uid;
  String nom;
  String prenom;
  MonProfileState({required this.uid, required this.nom, required this.prenom});
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
            "nombreJetons": doc['nombreJetons'],
            "montant": doc["montant"]
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
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

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
    bool isSwitched = true;
    try {
      return Scaffold(
          body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue.shade200,
              Colors.blue,
              Colors.green.shade200
            ],
          )),
        ),
        Positioned(top: 0, child: Image.asset('assets/Path 1013.png')),

        Positioned(
            top: 90,
            left: 127,
            child: Stack(children: [
              Image.asset('assets/Ellipse 365.png'),
              Positioned(
                  left: 39,
                  top: 35,
                  child: Image.asset('assets/profilAccount.png'))
            ])),
        Positioned(
            top: 220,
            left: w / 2 - 70,
            child: Text(nom + ' ' + prenom,
                style: TextStyle(color: Colors.white, fontSize: 20))),
        //--------------
        Positioned(
            top: 230,
            child: Column(children: [
              Row(children: [
                SizedBox(width: 40),
                SizedBox(
                  width: 30,
                ),
              ]),
              SizedBox(
                height: 30,
              ),
              Row(children: [
                SizedBox(width: 25),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: w - 50,
                        height: 300,
                        color: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: Text(
                                  "MON COMPTE",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      decoration: TextDecoration.none,
                                      fontWeight: FontWeight.bold),
                                )),
                                SizedBox(
                                  height: 20,
                                ),
                                TextButton(
                                  child: Row(children: [
                                    Text(
                                      "Modifier mes informations",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    SizedBox(width: 60),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                      color: Colors.black,
                                    )
                                  ]),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ModifierMesInfos(uid: uid)),
                                    );
                                  },
                                ),
                                TextButton(
                                  child: Row(children: [
                                    Text("Nombre de jetons",
                                        style: TextStyle(color: Colors.black)),
                                    SizedBox(
                                      width: 50,
                                    ),
                                    Text(userData[idUser]['nombreJetons'])
                                  ]),
                                  onPressed: () {},
                                ),
                                TextButton(
                                  child: Row(children: [
                                    Text("Mon montant",
                                        style: TextStyle(color: Colors.black)),
                                    SizedBox(width: 50),
                                    Text(userData[idUser]['montant'])
                                  ]),
                                  onPressed: () {},
                                )
                              ],
                            ))))
              ]),
              SizedBox(height: 20),
              Row(children: [
                SizedBox(width: 25),
              ])
            ])),

        Positioned(
            top: 40,
            left: 10,
            child: IconButton(
                icon: Image.asset('assets/arrow.png'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MyHomePage(
                      uid: uid,
                    );
                  }));
                })),
        Positioned(
            top: 40,
            right: 0,
            child: IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  logoutUser();
                })),
        //-------------
        Positioned(top: h - 212, child: Image.asset('assets/DOWN@xu45.png')),
        Positioned(
            top: h - 40,
            child: Row(
              children: [
                SizedBox(width: 20),
                Text("Powered by", style: TextStyle(fontSize: 11)),
                TextButton(
                  child: Text("WI-MOBI.COM",
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  onPressed: () {
                    openurl();
                  },
                ),
                SizedBox(width: 40),
                Text("Zid",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 11)),
                Text("© 2021 All Rights Reserved",
                    style: TextStyle(fontSize: 11))
              ],
            ))
      ]));
    } catch (e) {
      return Text("logging");
    }
  }

  void logoutUser() async {
    AuthentificationService _auth = AuthentificationService();
    await _auth.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SeConnecter()),
    );
  }
}

openurl() {
  String url1 = "https://www.WI-MOBI.com";
  launch(url1);
}
