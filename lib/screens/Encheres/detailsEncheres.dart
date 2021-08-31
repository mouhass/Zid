import 'dart:async';

import 'package:flutter/material.dart';
import 'package:date_count_down/date_count_down.dart';

import 'package:url_launcher/url_launcher.dart';

class deatilsEncheres extends StatefulWidget {
  String avancement;
  String date;
  String nomProduit;
  String imageProduit;
  deatilsEncheres(
      {required this.imageProduit,
      required this.nomProduit,
      required this.date,
      required this.avancement});
  @override
  State<StatefulWidget> createState() => deatilsEncheresState(
        imageProduit: this.imageProduit,
        nomProduit: this.nomProduit,
        date: this.date,
        avancement: this.avancement,
      );
}

class deatilsEncheresState extends State<deatilsEncheres> {
  String avancement;
  String date;
  String nomProduit;
  String imageProduit;
  deatilsEncheresState(
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
    countTime = CountDown().timeLeft(DateTime.parse(date), "terminé");
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
        color: Colors.white,
        child: Row(children: <Widget>[
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
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
              Widget>[
            Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                    height: 28,
                    width: (116 / 360) * w,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0XFF30A6CA),
                        Colors.lightBlue.shade100,
                      ],
                    )),
                    child: Row(
                      children: [
                        SizedBox(width: 4),
                        Image(
                            image: AssetImage(
                                'assets/Icon material-timelapse.png'),
                            width: (18 / 360) * w),
                        SizedBox(width: 4),
                        Text(countTime,
                            style: const TextStyle(
                                fontSize: 11, color: Colors.white)),
                      ],
                    )),
              ),
              SizedBox(width: 8),
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
                          Text("Prix de magasin",
                              style: TextStyle(fontSize: 12)),
                          Container(width: (30 / 360) * w)
                        ]),
                        SizedBox(
                          height: 12,
                        ),
                        Row(children: [Text("899DT"), Container(width: 77)])
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
                          style:
                              TextStyle(fontSize: 11, color: Colors.grey[500])),
                      Row(children: [
                        Text(
                          "297DT",
                          style: TextStyle(color: Colors.red, fontSize: 11),
                        ),
                        Text(" de remise",
                            style: TextStyle(
                                fontSize: 11, color: Colors.grey[500])),
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
                  "J'ai participé",
                  style: TextStyle(color: Colors.grey.shade400, fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.grey.shade200),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ))),
            ),

//---------------
          ]),
        ]));
  }
}

openurl() {
  String url1 = "https://www.cyberio.tn/index.php";
  launch(url1);
}
