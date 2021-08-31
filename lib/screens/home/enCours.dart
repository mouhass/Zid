import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zid/screens/produits/detailsProduitEnDirect.dart';
import 'package:zid/screens/home/pageSpeciale.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProduitsEnCours extends StatefulWidget {
  String imageProduit;
  String nomProduit;
  String uid;
  String date;
  ProduitsEnCours(
      {required this.uid,
      required this.imageProduit,
      required this.nomProduit,
      required this.date});
  @override
  EnCours createState() => EnCours(
        uid: this.uid,
        imageProduit: this.imageProduit,
        nomProduit: this.nomProduit,
        date: this.date,
      );
}

class EnCours extends State<ProduitsEnCours> {
  String valeurDeLimage = "img.png";
  String imageProduit;
  String nomProduit;
  String uid;
  String date;
  EnCours({
    required this.uid,
    required this.imageProduit,
    required this.nomProduit,
    required this.date,
  });

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Stack(
          children: [
            Image(
              image: AssetImage('assets/Rectangle 247.png'),
              width: 390,
              height: 170,
            ),
            Positioned(
                left: 120,
                top: 20,
                child: Material(
                    color: Colors.transparent,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => detailsProduitDirect(
                                    uid: uid,
                                    imageProduit: imageProduit,
                                    nomProduit: nomProduit,
                                  )),
                        );
                      },
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image(
                              image: AssetImage(imageProduit),
                              filterQuality: FilterQuality.high,
                              width: 120.0,
                              height: 150.0),
                        ),
                      ),
                    ))),
            Positioned(
                left: 280,
                top: 10,
                child: IconButton(
                  icon: Image(image: AssetImage('assets/${valeurDeLimage}')),
                  onPressed: () {
                    if (valeurDeLimage == "img.png") {
                      valeurDeLimage = "image1.png";
                    } else {
                      valeurDeLimage = "img.png";
                    }
                  },
                )),
            Positioned(
                left: 30,
                top: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                        image: AssetImage(
                          'assets/Groupe 484@1X.png',
                        ),
                        height: 50,
                        width: 50))),
          ],
        ),
        SizedBox(height: 20),
        Row(
          children: [
            SizedBox(width: 28),
            Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                      color: Colors.red,
                      width: 119,
                      height: 28,
                      child: Center(
                          child: Text(
                        "En direct",
                        style: const TextStyle(color: Colors.white),
                      )))),
            ]),
            SizedBox(width: 10),
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      width: 80,
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
                Positioned(
                    left: 7,
                    top: 3,
                    child:
                        Image(image: AssetImage('assets/Groupe 457@1X.png'))),
                Positioned(left: 35, top: 5, child: Text("100%"))
              ],
            )
          ],
        ),
        Row(children: [
          SizedBox(width: 30, height: 40),
          Text(
            nomProduit,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(width: 80)
        ]),
        Row(
          children: [
            SizedBox(width: 30),
            Column(
              children: [
                Text("\nPrix magasin    "),
                Text(
                  "\n899DT",
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough),
                ),
              ],
            ),
            SizedBox(width: 110),
            Column(
              children: [
                Text("\nPrix en cours"),
                Text(
                  "\n250DT",
                  style: const TextStyle(color: Colors.red),
                ),
              ],
            )
          ],
        ),
        SizedBox(height: 20),
        Container(
            width: 300,
            height: 71,
            child: RaisedButton(
              child: Column(
                children: [
                  Row(children: [
                    Text("Achetez directement et gagner"),
                    Container(
                      width: 20,
                    )
                  ]),
                  Row(
                    children: [
                      Text(
                        "279DT",
                        style: const TextStyle(color: Colors.red),
                      ),
                      Text(
                        "de remise",
                      )
                    ],
                  ),
                  Row(children: [
                    Image(
                        image: AssetImage('assets/cyberio.jpg'),
                        width: 90,
                        height: 21),
                    SizedBox(width: 100),
                    Image(
                        image: AssetImage(
                            'assets/Icon ionic-ios-arrow-dropright.png'),
                        width: 60,
                        height: 21)
                  ]),
                ],
              ),
              onPressed: () {
                openurl();
              },
            ))
      ],
    ));
  }
}

openurl() {
  String url1 = "https://www.cyberio.tn/index.php";
  launch(url1);
}
