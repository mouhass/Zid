import 'dart:async';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class deatilsFavoris extends StatefulWidget {
  double avancement;
  String date;
  String nomProduit;
  String imageProduit;
  deatilsFavoris(
      {required this.imageProduit,
      required this.nomProduit,
      required this.date,
      required this.avancement});
  @override
  State<StatefulWidget> createState() => deatilsFavorisState(
        imageProduit: this.imageProduit,
        nomProduit: this.nomProduit,
        date: this.date,
        avancement: this.avancement,
      );
}

class deatilsFavorisState extends State<deatilsFavoris> {
  double avancement;
  String date;
  String nomProduit;
  String imageProduit;
  deatilsFavorisState(
      {required this.imageProduit,
      required this.nomProduit,
      required this.date,
      required this.avancement});
  Color favoriteColor = Colors.grey;
  int _currentIndex = 0;
  String countTime = "Loading";
  Timer _timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  String imageDuCoeur = "img.png";
  Color topNavSelected1 = Colors.lightBlue;
  Color topNavSelected2 = Colors.grey;
  Color topNavSelected3 = Colors.grey;
  void initState() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Row(children: <Widget>[
      Column(children: [
        Stack(
          children: [
            Container(
                child: Stack(
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
                              borderRadius: BorderRadius.circular(10)))
                    ])),
                Positioned(
                    left: 87,
                    top: 10,
                    child: IconButton(
                      icon: Image.asset('assets/image1.png'),
                      onPressed: () {},
                    )),
                Positioned(
                    top: 35,
                    left: 2,
                    child: Material(
                        color: Colors.transparent,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(imageProduit,
                                  width: 150.0, height: 150.0),
                            ),
                          ),
                        ))),
              ],
            )),
          ],
        ),
        Container(
          height: 55,
        )
      ]),
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
        SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Text(nomProduit,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
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
                      Text("Prix de magasin", style: TextStyle(fontSize: 12)),
                      Container(width: (30 / 360) * w)
                    ]),
                    SizedBox(
                      height: 12,
                    ),
                    Row(children: [
                      Text("899DT",
                          style: TextStyle(
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
          onPressed: () {},
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

//---------------
      ]),
    ]);
  }
}

openurl() {
  String url1 = "https://www.cyberio.tn/index.php";
  launch(url1);
}
