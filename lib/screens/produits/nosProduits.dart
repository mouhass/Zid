import 'dart:async';
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:get/get.dart';
import 'package:telephony/telephony.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:zid/screens/produits/detailsProduits.dart';
import 'package:zid/services/database.dart';

class NosProduit extends StatefulWidget {
  String uid;
  String productID;
  String avancement;
  String date;
  String vipOrNot;
  Color theColor;
  String imageProduit;
  String nomProduit;
  NosProduit(
      {required this.uid,
      required this.productID,
      required this.imageProduit,
      required this.theColor,
      required this.vipOrNot,
      required this.date,
      required this.avancement,
      required this.nomProduit});
  @override
  State<StatefulWidget> createState() => NosProduitsState(
        uid: this.uid,
        productID: this.productID,
        imageProduit: this.imageProduit,
        theColor: this.theColor,
        vipOrNot: this.vipOrNot,
        date: this.date,
        avancement: this.avancement,
        nomProduit: this.nomProduit,
      );
}

class NosProduitsState extends State<NosProduit> {
  String uid;
  String productID;
  String avancement;
  String date;
  String vipOrNot;
  Color theColor;
  String imageProduit;
  String nomProduit;
  NosProduitsState(
      {required this.uid,
      required this.productID,
      required this.imageProduit,
      required this.theColor,
      required this.vipOrNot,
      required this.date,
      required this.avancement,
      required this.nomProduit});
  Color favoriteColor = Colors.grey;
  int _currentIndex = 0;
  String countTime = "Loading";
  String imageDuCoeur = "img.png";
  Color topNavSelected1 = Colors.lightBlue;
  Color topNavSelected2 = Colors.grey;
  Color topNavSelected3 = Colors.grey;
  RxInt count = 200.obs;
  final CollectionReference userbaseRef =
      FirebaseFirestore.instance.collection('users');
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

  Future<List> readuserdata() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await userbaseRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {"id": doc.id, "encheres": doc['encheres']};
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
    List docs = [];
    List userData = [];
    setState(() {
      read().then((value) => setState(() {
            docs = value;
          }));

      readuserdata().then((value) => setState(() {
            userData = value;
          }));
    });
    void modifierMontant(RxInt montant) {
      DatabaseService ds = DatabaseService(uid: uid);
      ds.updateMontant(montant);
    }

    void modifierAvancement(String productID, String avancement) {
      DatabaseService ds = DatabaseService(uid: uid);
      ds.updateAvancement(productID, avancement);
    }

    void modifierEncheres(String productID, String nomProduit,
        String imageProduit, String avancement, String date) {
      DatabaseService ds = DatabaseService(uid: uid);
      ds.updateEncheres(productID, nomProduit, imageProduit, avancement, date);
    }

    void addEnCours(String imageProduit, String nomProduit) {
      DatabaseService ds = DatabaseService(uid: uid);
      ds.updateEnCours(imageProduit, nomProduit);
    }

    for (int i = 0; i < docs.length; i++) {
      for (int j = 0; j < userData.length; j++) {
        for (int k = 0; k < userData[j]['encheres'].length; k++) {
          if (docs[i]['avancement'] == "100.0" &&
              userData[j]['encheres'][k]['productID'] ==
                  "nMisolzNVKDPSCAArsAP") {
            addEnCours(docs[i]['imageProduit'], docs[i]['nomProduit']);
          }
        }
      }
    }

    countTime = CountDown().timeLeft(DateTime.parse(date), "terminé");
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    int y = docs.length;
    int z = userData.length;

    return Row(children: <Widget>[
      Column(children: [
        Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 9),
                    borderRadius: BorderRadius.circular(20)),
                child: Stack(children: [
                  Container(
                    width: 130,
                    height: 150,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Colors.lightBlue.shade500,
                          ],
                        ),
                        border: Border.all(color: theColor, width: 7),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Positioned(
                      left: 83,
                      top: 10,
                      child: IconButton(
                        icon: Image.asset('assets/${imageDuCoeur}'),
                        onPressed: () {
                          if (imageDuCoeur == "img.png") {
                            imageDuCoeur = "image1.png";
                          } else {
                            imageDuCoeur = "img.png";
                          }
                        },
                      )),
                  Positioned(
                      top: 15,
                      left: 15,
                      child: Image.asset(vipOrNot, height: 40, width: 40)),
                ])),
            Positioned(
                top: 33,
                left: 2,
                child: Material(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detailsProduit(
                                    uid: uid,
                                    imageProduit: this.imageProduit,
                                    theColor: this.theColor,
                                    vipOrNot: this.vipOrNot,
                                    date: this.date,
                                    avancement: this.avancement,
                                    nomProduit: this.nomProduit,
                                  )),
                        );
                      },
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                              image: AssetImage(imageProduit),
                              filterQuality: FilterQuality.high,
                              width: 150.0,
                              height: 150.0),
                        ),
                      ),
                    ))),
          ],
        ),
        Container(
          height: 55,
        )
      ]),
      SizedBox(width: 0),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        SizedBox(width: 8),
        Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                  width: (100 / 360) * w, height: 28, color: Colors.grey[300])),

          ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: double.parse(avancement),
                height: 28,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0XFFC772FF),
                    Colors.white,
                  ],
                )),
              )),
          //----------------------------------------------

          Positioned(
            top: 3,
            left: 5,
            child: Image(
              image: AssetImage('assets/Groupe 457@1X.png'),
              width: (20 / 360) * w,
              height: 20,
            ),
          ),
          Positioned(
            top: 4,
            left: 38,
            child: Text(
                '${((double.parse(avancement) / 100) * 100).toStringAsFixed(0)}%'),
          ),
        ]),

        SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(nomProduit, style: TextStyle(fontSize: 13)),
              Container(width: (30 / 360) * w)
            ]),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Row(children: [
                      Text("Prix magazin", style: TextStyle(fontSize: 12)),
                      // Text(y.toString(), style: TextStyle(fontSize: 12)),
                      // Text(z.toString(), style: TextStyle(fontSize: 12)),
                      Container(width: (30 / 360) * w)
                    ]),
                    SizedBox(
                      height: 12,
                    ),
                    Row(children: [
                      Text("899DT",
                          style: const TextStyle(
                              decoration: TextDecoration.lineThrough)),
                      Container(width: 77)
                    ])
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Prix de départ", style: TextStyle(fontSize: 12)),
                    SizedBox(height: 12),
                    Text("1DT", style: TextStyle(color: Colors.lightBlue)),
                  ],
                )
              ],
            )
          ],
        ),
        SizedBox(height: 5),

        TextButton(
          onPressed: () {
            openurl();
          },
          child: Container(
              width: 185,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Achetez directement et gagner",
                      style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                  Row(children: [
                    Text(
                      "297DT",
                      style: TextStyle(color: Colors.red, fontSize: 11),
                    ),
                    Text(" de remise",
                        style:
                            TextStyle(fontSize: 11, color: Colors.grey[500])),
                    SizedBox(width: 60),
                    Image(
                        image: AssetImage(
                            'assets/Icon ionic-ios-arrow-dropright.png'),
                        width: 40,
                        height: 21)
                  ]),
                  Image(
                      image: AssetImage('assets/cyberio.jpg'),
                      width: (90 / 360) * w,
                      height: 21),
                ],
              )),
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.grey.shade200),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ))),
        ),
//----------------

        TextButton(
          onPressed: () {
            count = count - 6;
            modifierMontant(count);

            for (int i = 0; i < docs.length; i++)
              if (docs[i]['productID'] == productID) {
                double x = double.parse(docs[i]['avancement']) + 1;
                modifierAvancement(productID, x.toString());
                print(
                    'wow----- -----           ---------------           --------------------');
                modifierEncheres(
                    productID,
                    docs[i]['nomProduit'],
                    docs[i]['imageProduit'],
                    docs[i]['avancement'],
                    docs[i]['date']);
              }
          },
          child: Container(
            width: 185,
            child: Text(
              "Participer à 6 DT",
              style: TextStyle(color: Colors.white, fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ))),
        ),

        SizedBox(height: 10),
        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("Loading");
              }
              DocumentSnapshot<Object?> documentData =
                  snapshot.data as DocumentSnapshot;
              //return new Text(documentData['avancement'].toString());
              return Text("");
            }),

        StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return new Text("Loading");
              }
              DocumentSnapshot<Object?> documentData =
                  snapshot.data as DocumentSnapshot;
              count = RxInt(int.parse(documentData['montant'])) as RxInt;
              return Text("");
            }),

//---------------
      ]),
    ]);
  }
}

openurl() {
  String url1 = "https://www.cyberio.tn/index.php";
  launch(url1);
}
