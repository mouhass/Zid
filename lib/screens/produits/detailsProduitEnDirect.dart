import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'package:zid/screens/home/secondScreen.dart';
import 'package:zid/services/database.dart';

class detailsProduitDirect extends StatefulWidget {
  String uid;
  String imageProduit;
  String nomProduit;

  detailsProduitDirect({
    required this.uid,
    required this.imageProduit,
    required this.nomProduit,
  });

  @override
  State<StatefulWidget> createState() => detailsProduitDirectState(
        uid: this.uid,
        imageProduit: imageProduit,
        nomProduit: nomProduit,
      );
}

class detailsProduitDirectState extends State<detailsProduitDirect> {
  String uid;

  String imageProduit;
  String nomProduit;
  detailsProduitDirectState({
    required this.uid,
    required this.imageProduit,
    required this.nomProduit,
  });

  List docs = [];
  List userList = [];

  final CollectionReference databaseRef =
      FirebaseFirestore.instance.collection('products');
  final CollectionReference usersInfo =
      FirebaseFirestore.instance.collection('users');
//---------------------------------------------------------
  Future<List> read() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await databaseRef.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "date": doc['date'],
            "prixEnCours": doc['prixEnCours'],
            "estTermine": doc['estTermine'],
            "pileEnchere": doc['pileEnchere'],
            "nomProduit": doc['nomProduit'],
            "imageProduit": doc['imageProduit']
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

//---------------------------------------------------------
  Future<List> usersData() async {
    QuerySnapshot querySnapshot;
    List docs = [];
    try {
      querySnapshot = await usersInfo.get();
      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs.toList()) {
          Map a = {
            "id": doc.id,
            "nombreJetons": doc['nombreJetons'],
            "prenom": doc['firstName'],
            "nom": doc['secondName']
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
  void initState() {
    super.initState();
  }

  int idUser = 0;
  @override
  Widget build(BuildContext context) {
    setState(() {
      usersData().then((value) => setState(() {
            userList = value;
          }));
      read().then((value) => setState(() {
            docs = value;
          }));

      for (int i = 0; i < userList.length; i++) {
        if (userList[i]["id"] == uid) {
          idUser = i;
        }
      }
    });
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('kk:mm:ss \n EEE d MMM').format(now);

    double w = MediaQuery.of(context).size.width;
    // nombreJetons = RxString(userList[0]['nombreJetons']);
    // prixEnCours = RxString(docs[0]['prixEnCours']);
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Column(children: [
      //premiere partie
      Stack(children: [
        Container(
          width: (360 / 360) * w,
          height: 264,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.lightBlue.shade300,
              Colors.blue,
              Colors.lightBlue.shade300
            ],
          )),
        ),
        Positioned(
            left: 10,
            top: 30,
            child: IconButton(
              icon: Image.asset('assets/arrow.png'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MyHomePage(
                    uid: uid,
                  );
                }));
              },
            )),
        Positioned(
            top: 50,
            left: 90,
            child: Image.asset(
              imageProduit,
              width: 180,
              height: 180,
            ))
      ]),

      //fin de la premiere partie
      //debut de la deuxieme partie
      Container(
          child: Stack(children: [
        Wrap(children: [
          Container(
            color: Colors.blue.shade400,
            width: (180 / 360) * w,
            height: 100,
          ),
          Container(
              color: Colors.lightBlue.shade300,
              width: (180 / 360) * w,
              height: 100)
        ]),
        Container(
            width: (360 / 360) * w,
            height: 1000,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: 150,
                      child: TextButton(
                        child: Center(
                            child: Text("Enchère en direct",
                                style: TextStyle(color: Colors.white))),
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: () {},
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Text(nomProduit,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      Column(
                        children: [
                          Text('Prix magazin'),
                          SizedBox(
                            height: 20,
                          ),
                          Text("899DT",
                              style: const TextStyle(
                                  decoration: TextDecoration.lineThrough))
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text('Prix de départ'),
                          SizedBox(
                            height: 20,
                          ),
                          Text("1DT", style: TextStyle(color: Colors.lightBlue))
                        ],
                      ),
                      SizedBox(width: 20),
                      Column(
                        children: [
                          Text('Prix en cours'),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              double.parse(docs[2]['prixEnCours'])
                                  .toStringAsFixed(1),
                              style: TextStyle(color: Colors.red))
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.lightBlue.shade50),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ))),
                          onPressed: () {},
                          child: Wrap(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nombre des jetons"),
                                  Text("disponsibles"),
                                  Text(
                                      userList[idUser]['nombreJetons']
                                          .toString(),
                                      style: TextStyle(
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20))
                                ],
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Container(
                                  width: 100,
                                  child: TextButton(
                                    onPressed: () {},
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
                                            MaterialStateProperty.all<Color>(
                                                Color(0XFFE25033)),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ))),
                                  )),
                            ],
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Wrap(
                    children: [
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0XFFE25033)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        child: Column(
                          children: [
                            Image.asset('assets/Logo@1X.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text("+0.100DT",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        onPressed: () {
                          DateTime now = DateTime.now();

                          if (userList[idUser]['nombreJetons'] != "0" &&
                              docs[idUser]['estTermine'] == false) {
                            encherire("0.1", docs[2]['prixEnCours'],
                                docs[idUser]["id"]);
                            addContributionToPile(
                                docs[idUser]['prixEnCours'],
                                userList[idUser]['prenom'],
                                userList[idUser]['nom'],
                                now.toString());
                          }
                        },
                      ),
                      SizedBox(width: 30),

                      Column(children: <Widget>[
                        if (docs[idUser]['estTermine'] == false)
                          CircularCountDownTimer(
                            // Countdown duration in Seconds.
                            duration: 600,

                            // Countdown initial elapsed Duration in Seconds.
                            initialDuration: 0,

                            // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.

                            // Width of the Countdown Widget.
                            width: 100,

                            // Height of the Countdown Widget.
                            height: 100,

                            // Ring Color for Countdown Widget.
                            ringColor: Colors.grey[300]!,

                            // Ring Gradient for Countdown Widget.
                            ringGradient: null,

                            // Filling Color for Countdown Widget.
                            fillColor: Colors.purpleAccent[100]!,

                            // Filling Gradient for Countdown Widget.
                            fillGradient: null,

                            // Background Color for Countdown Widget.
                            backgroundColor: Colors.purple[500],

                            // Background Gradient for Countdown Widget.
                            backgroundGradient: null,

                            // Border Thickness of the Countdown Ring.
                            strokeWidth: 20.0,

                            // Begin and end contours with a flat edge and no extension.
                            strokeCap: StrokeCap.round,

                            // Text Style for Countdown Text.
                            textStyle: TextStyle(
                                fontSize: 33.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),

                            // Format for the Countdown Text.
                            textFormat: CountdownTextFormat.MM_SS,

                            isTimerTextShown: true,

                            // Handles the timer start.
                            autoStart: true,

                            // This Callback will execute when the Countdown Starts.
                            onStart: () {
                              // Here, do whatever you want
                              print('Countdown Started');
                            },

                            // This Callback will execute when the Countdown Ends.
                            onComplete: () {
                              // Here, do whatever you want
                              terminerEnchere();

                              modifierTermine(
                                  nomProduit,
                                  imageProduit,
                                  docs[idUser]['pileEnchere'][
                                          docs[idUser]['pileEnchere'].length -
                                              1]['nom']
                                      .toString(),
                                  docs[idUser]['pileEnchere'][
                                          docs[idUser]['pileEnchere'].length -
                                              1]['prenom']
                                      .toString(),
                                  docs[idUser]['pileEnchere']
                                              [docs[idUser]['pileEnchere'].length - 1]
                                          ['prixEnCours']
                                      .toString());
                            },
                          ),
                        if (docs[idUser]['estTermine'] == true)
                          Text("l'enchère est terminé",
                              style: TextStyle(color: Colors.red)),
                      ]),
                      //---------------------
                      //--------------------
                      SizedBox(width: 20),
                      TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0XFFE25033)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        child: Column(
                          children: [
                            Image.asset('assets/Logo@1X.png'),
                            SizedBox(
                              height: 10,
                            ),
                            Text("+0.200DT",
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                        onPressed: () {
                          DateTime now = DateTime.now();

                          // print(now.hour.toString() + ":" + now.minute.toString() + ":" + now.second.toString());

                          if (userList[idUser]['nombreJetons'] != "0" &&
                              docs[idUser]['estTermine'] == false) {
                            encherire("0.2", docs[2]['prixEnCours'],
                                docs[idUser]["id"]);
                            print(now.toString());
                            addContributionToPile(
                                docs[idUser]['prixEnCours'],
                                userList[idUser]['prenom'],
                                userList[idUser]['nom'],
                                now.toString());
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            )),
      ]))
    ]))));
  }

  void encherire(String valeurAjoute, String valeurEnCours, String productID) {
    DatabaseService ds = DatabaseService(uid: uid);

    ds.encher(valeurAjoute, valeurEnCours, productID);
    ds.modifierJeton(userList[idUser]['nombreJetons'].toString());
  }

  void terminerEnchere() {
    DatabaseService ds = DatabaseService(uid: uid);
    ds.terimerEnchere();
  }

  void addContributionToPile(
      String prixEnCours, String prenom, String nom, String currentDate) {
    DatabaseService ds = DatabaseService(uid: uid);
    ds.addToPileEnchere(prixEnCours, prenom, nom, currentDate);
  }

  void modifierTermine(String nomProduit, String imageProduit,
      String nomGagnant, String prenomGagnant, String prixFinal) {
    DatabaseService ds = DatabaseService(uid: uid);
    ds.termine(nomProduit, imageProduit, nomGagnant, prenomGagnant, prixFinal);
  }
}
