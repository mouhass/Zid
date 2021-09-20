import 'dart:async';

import 'dart:io';
import 'dart:typed_data';
import 'package:share/share.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:date_count_down/date_count_down.dart';

import 'package:url_launcher/url_launcher.dart';

import 'package:zid/screens/home/secondScreen.dart';

// required this.imageProduit,
//       required this.theColor,
//       required this.vipOrNot,
//       required this.date,
//       required this.avancement,
//       required this.nomProduit
class detailsProduit extends StatefulWidget {
  String uid;
  String imageProduit = "";
  Color theColor;
  String vipOrNot;
  String date;
  String avancement;
  String nomProduit;
  detailsProduit(
      {required this.uid,
      required this.imageProduit,
      required this.theColor,
      required this.vipOrNot,
      required this.date,
      required this.avancement,
      required this.nomProduit});
  @override
  lesDetails createState() => lesDetails(
      uid: this.uid,
      imageProduit: this.imageProduit,
      theColor: this.theColor,
      vipOrNot: this.vipOrNot,
      date: this.date,
      avancement: this.avancement,
      nomProduit: this.nomProduit);
}

class lesDetails extends State<detailsProduit> {
  String uid;
  String imageProduit = "";
  Color theColor;
  String vipOrNot;
  String date;
  String avancement;
  String nomProduit;

  lesDetails(
      {required this.uid,
      required this.imageProduit,
      required this.theColor,
      required this.vipOrNot,
      required this.date,
      required this.avancement,
      required this.nomProduit});

  int _current = 0;

  var i = 0;

  CarouselController carouselController = CarouselController();

  Timer _timer = Timer.periodic(const Duration(seconds: 1), (timer) {});
  String countTime = "Loading";
  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    List imgList = [
      imageProduit,
      imageProduit,
      imageProduit,
      imageProduit,
      imageProduit,
    ];
    List myindicator = [
      "assets/Group1.png",
      "assets/Group2.png",
      "assets/Group3.png",
      "assets/Group4.png",
      "assets/Group5.png"
    ];

    countTime = CountDown().timeLeft(DateTime.parse("2021-07-23"), "en attente");
    return Scaffold(
        body: Container(
            child: SingleChildScrollView(
                child: Column(
      children: [
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
          Center(
              child: Column(children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              imgList[i],
              width: 150,
              height: 170,
            ),
            SizedBox(
              height: 10,
            ),
            Image.asset(myindicator[i]),
          ])),
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
              left: w - 100,
              top: 30,
              child: IconButton(
                icon: Image.asset('assets/share.png'),
                onPressed: () {
                  Share.share('Some text');
                },
              )),
          Positioned(
              left: w - 60,
              top: 30,
              child: IconButton(
                icon: Image.asset('assets/img.png'),
                onPressed: () {},
              )),
          Positioned(
              left: w - 60,
              top: 130,
              child: IconButton(
                icon: Image.asset('assets/otherArrow.png'),
                onPressed: () {
                  // carouselController.nextPage();
                  //imgList.map((a) => e = a);
                  if (i < imgList.length - 1) {
                    i++;
                  } else {
                    i = 0;
                  }
                },
              )),
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
          ),

          Column(children: <Widget>[
            SizedBox(height: (20 / 712) * h),
            Wrap(children: [
              SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Container(
                    height: 28,
                    width: (140 / 360) * w,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0XFF30A6CA),
                        Colors.lightBlue.shade100,
                      ],
                    )),
                    child: Wrap(
                      children: [
                        Image(
                            image: AssetImage(
                                'assets/Icon material-timelapse.png'),
                            width: (20 / 360) * w),
                        Text(
                          countTime,
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )),
              ),
              SizedBox(width: (110 / 360) * w),
              Stack(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                        width: (70 / 360) * w,
                        height: 28,
                        color: Colors.grey[200])),

                ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Container(
                      width: (double.parse(avancement) / 360) * w,
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
                  left: (38 / 360) * w,
                  child: Text(
                      '${((double.parse(avancement) / 70) * 100).toStringAsFixed(0)}%'),
                ),
              ]),
              Container(width: 20),
            ]),
            SizedBox(
              height: 20,
            ),
            Row(children: [
              Container(width: (20 / 360) * w),
              Text(
                nomProduit,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ]),

            SizedBox(height: 15),
            Row(children: [
              SizedBox(width: (20 / 360) * w),
              Text("Montre connecté HUAWEI GT2 SPort Edition"),
            ]),
            Row(
              children: [
                SizedBox(width: (20 / 360) * w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("\nPrix magasin    "),
                    Row(children: [
                      Text(
                        "\n899DT",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough),
                      ),
                      Container(width: 50)
                    ]),
                  ],
                ),
                SizedBox(width: (130 / 360) * w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("\nPrix de départ"),
                    Wrap(children: [
                      Text(
                        "\n1DT",
                        style: const TextStyle(color: Colors.lightBlue),
                      ),
                      Container(width: 60)
                    ]),
                  ],
                )
              ],
            ),
            SizedBox(height: 5),
            Wrap(
              children: [
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 135,
                    child: Text(
                      "Participer à 6 DT",
                      style: TextStyle(color: Colors.white, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ))),
                ),
                SizedBox(width: 20),
                TextButton(
                  onPressed: () {},
                  child: Container(
                    width: 135,
                    child: Text(
                      "Acheter jetons",
                      style: TextStyle(color: Colors.red, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(width: 2.5, color: Colors.red)),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(width: 20),
                Text('Description',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(width: 20),
              ],
            ),
            SizedBox(height: 20),
            //le contenu de la description
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                  ),
                  width: 320,
                  height: 500,
                ),
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    width: 280,
                    height: 500,
                    child: Text(
                        "Montre Connecté HUAWEI Watch GT2 Sport Edition - Ecran:AMOLED 1.39\" (454x454)46mm - Système d'éxploitation" +
                            ":Android/iOS - Connectivité: Bluetooth 4.1- Mémoire RAM: 32Mo - Capacité:4Go - Capacité de Batterie:45mAh"
                                " - Système de locallisation:GPS - Capteurs: capteur accéléromètre, capteur gyroscope,capteur géomagnétique, capteur" +
                            "optique de fréquence cardiaque, capteur de lumière ambiante,capteur de pression atmosphérique, capteur atmosphérique" +
                            ",capteur capacitif - Matériaux: Métal + plastique - Résistant à l'eau: 5ATM résistant à l'eau - Dimensions: 45,9x45,9x10,7mm" +
                            " - Poids:41 gr - Couleur: Noir",
                        style: TextStyle(
                            fontSize: 14, height: 2, color: Colors.grey[800])),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: 320,
                height: 71,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: RaisedButton(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Wrap(children: [
                            Text('Achetez directement et gagner'),
                            Container(width: 0)
                          ]),
                          Wrap(children: [
                            Text('279DT', style: TextStyle(color: Colors.red)),
                            Text('de remise '),
                            SizedBox(width: 110),
                            Image(
                                image: AssetImage(
                                    'assets/Icon ionic-ios-arrow-dropright.png'),
                                width: 60,
                                height: 21)
                          ]),
                          Wrap(
                            children: [
                              Image(
                                  image: AssetImage('assets/cyberio.jpg'),
                                  width: 90,
                                  height: 21),
                              Container(width: 0)
                            ],
                          ),
                        ],
                      ),
                      onPressed: () {
                        openurl();
                      }),
                )),
          ]), //ici se termine le column general
        ])),
      ],
    ))));
  }
}

openurl() {
  String url1 = "https://www.cyberio.tn/index.php";
  launch(url1);
}
