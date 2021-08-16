import 'package:flutter/material.dart';
import 'package:zid/screens/home/produitFini.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProduitsTermines extends StatefulWidget {
  @override
  termine createState() => termine();
}

class termine extends State<ProduitsTermines> {
  @override
  void initState() {
    super.initState();
  }

  CollectionReference users = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            color: Colors.white,
            child: Column(children: [
              ProduitFini(
                imageProduit:
                    'assets/JBL_Flip5_Product Photo_Hero_Ocean Blue@1X.png',
                nomProduit: "JBL FLIP4",
                quiRemporte: "Zizou2001",
              ),
              ProduitFini(
                imageProduit: 'assets/smartWatch.png',
                nomProduit: "HUAWEI SMART WATCH GT2",
                quiRemporte: "Foulen",
              ),
              ProduitFini(
                imageProduit:
                    'assets/JBL_Flip5_Product Photo_Hero_Ocean Blue@1X.png',
                nomProduit: "JBL FLIP4",
                quiRemporte: "Zizou2001",
              ),
              FutureBuilder<DocumentSnapshot>(
                future: users.doc("QAYRc8SMgvaltx0VRK3CBz8V7Pw2").get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  try {
                    Map<String, dynamic> data =
                        snapshot.data!.data() as Map<String, dynamic>;
                    return Text(data.toString());
                  } catch (e) {
                    return Text("loading");
                  }
                },
              )
            ])));
  }
}
