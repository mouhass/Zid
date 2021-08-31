import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zid/screens/home/afficherEnCours.dart';
import 'package:zid/screens/produits/affichageDesProduits.dart';
import 'package:zid/screens/profile/monProfile.dart';

import 'package:zid/screens/home/enCours.dart';
import 'package:zid/screens/home/termine.dart';

class pageSpeciale extends StatefulWidget {
  String uid;
  pageSpeciale({required this.uid});
  @override
  nouvellePage createState() => nouvellePage(uid: this.uid);
}

class nouvellePage extends State<pageSpeciale> {
  String uid;
  nouvellePage({required this.uid});
  Color favoriteColor = Colors.grey;
  int _currentIndex = 0;
  String countTime = "Loading";
  Timer _timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  String imageDuCoeur = "img.png";
  Color topNavSelected1 = Colors.blue;
  Color topNavSelected2 = Colors.grey;
  Color topNavSelected3 = Colors.grey;

  int SelectedItem = 0;
  //String NouvelCouleurDuCoeur = "image1.png";

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});

    RxInt count = 200.obs;
    countTime = CountDown().timeLeft(DateTime.parse("2021-07-21"), "completed");
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: false,
                elevation: 0,
                title: Image(image: AssetImage('assets/Logo@1X.png')),
                backgroundColor: Colors.white,
                actions: [
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
                        count =
                            RxInt(int.parse(documentData['montant'])) as RxInt;
                        return Center(
                            child: Text("Votre montant: " + count.toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)));
                      }),
                  IconButton(
                    icon: Image.asset('assets/avatar.png'),
                    color: Colors.orange,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MonProfile(
                          uid: uid,
                        );
                      }));
                    },
                  ),
                ],
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text("Prochaines",
                            style: TextStyle(color: Colors.lightBlue))),
                    Tab(
                        child: Text("En cours",
                            style: TextStyle(color: Colors.lightBlue))),
                    Tab(
                        child: Text("Terminés",
                            style: TextStyle(color: Colors.lightBlue)))
                  ],
                )),
            body: TabBarView(
              children: [
                AfficherProduits(
                  uid: uid,
                ),
                AffichageEnCours(uid: uid),
                ProduitsTermines(uid: uid),
              ],
            )));
  }
}
