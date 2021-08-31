import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zid/services/database.dart';

class Jeton extends StatefulWidget {
  String uid;
  String theImage;
  Color couleurDuPrix = Colors.white;
  Color myColor = Colors.white;
  int prix;
  String vip;
  int nombrePacket;
  Jeton(
      {required this.uid,
      required this.theImage,
      required this.couleurDuPrix,
      required this.myColor,
      required this.prix,
      required this.vip,
      required this.nombrePacket});
  State<StatefulWidget> createState() => JetonState(
      uid: this.uid,
      theImage: this.theImage,
      couleurDuPrix: this.couleurDuPrix,
      myColor: this.myColor,
      prix: this.prix,
      vip: this.vip,
      nombrePacket: this.nombrePacket);
}

class JetonState extends State<Jeton> {
  String uid;
  String theImage;
  Color couleurDuPrix = Colors.white;
  Color myColor = Colors.white;
  int prix;
  String vip;
  int nombrePacket;
  JetonState(
      {required this.uid,
      required this.theImage,
      required this.couleurDuPrix,
      required this.myColor,
      required this.prix,
      required this.vip,
      required this.nombrePacket});

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
            "montant": doc['montant'],
            "nombreJetons": doc['nombreJetons']
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
    return Container(
        child: Stack(children: [
      Row(children: [
        Container(width: 10),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            height: 110,
            width: 330,
            color: myColor,
          ),
        )
      ]),
      Positioned(
          left: 20,
          top: 25,
          child: Container(width: 80, child: Image.asset(theImage))),
      Positioned(
          top: 10,
          left: 130,
          child: Container(width: 80, child: Image.asset('${vip}'))),
      Row(
        children: [
          Container(width: 240),
          Column(children: [
            SizedBox(
              height: 12,
            ),
            Text("${prix}DT",
                style: TextStyle(
                    color: couleurDuPrix,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(
              height: 5,
            ),
            TextButton(
              onPressed: () {
                for (int i = 0; i < userData.length; i++) {
                  if (userData[i]['id'] == uid &&
                      int.parse(userData[i]['montant']) - prix > 0) {
                    modifications(prix, nombrePacket,
                        userData[i]['nombreJetons'], userData[i]['montant']);
                  }
                }
              },
              child: Row(children: [
                Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
                Text(
                  "Acheter",
                  style: TextStyle(color: Colors.white),
                )
              ]),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0XFFE25033)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
            ),
          ])
        ],
      )
    ]));
  }

  void modifications(
      int prix, int nbrePacket, String nombreJetons, String montant) {
    DatabaseService ds = DatabaseService(uid: uid);
    ds.updateNbreJetonsMontant(prix, nbrePacket, nombreJetons, montant);
  }
}
