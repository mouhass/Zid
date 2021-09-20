import 'package:flutter/material.dart';
import 'package:zid/screens/favoris/detailsFavoris.dart';
import 'package:zid/screens/profile/monProfile.dart';

class MesFavoris extends StatefulWidget {
  String uid;
  MesFavoris({required this.uid});
  State<StatefulWidget> createState() => MesFavorisState(uid: uid);
}

class MesFavorisState extends State<MesFavoris> {
  String uid;
  MesFavorisState({required this.uid});
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image(image: AssetImage('assets/Logo@1X.png')),
          backgroundColor: Colors.white,
        ),
        body: Container(
            color: Colors.white,
            child: Padding(
                padding: EdgeInsets.all(5),
                child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      SizedBox(height: 20),
                      Row(children: [
                        SizedBox(width: 14),
                        Text("Mes favoris",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ]),
                      deatilsFavoris(
                        imageProduit: 'assets/smartWatch.png',
                        nomProduit: "HUAWEI SMART WATCH GT2",
                        date: "2021-07-21",
                        avancement: 17,
                      ),
                      deatilsFavoris(
                        imageProduit: 'assets/modifiedphone.png',
                        nomProduit: "REDMI 7A BLACK",
                        date: "2021-07-22",
                        avancement: 23,
                      ),
                    ]))))));
  }
}
