import 'package:flutter/material.dart';

class Jeton extends StatelessWidget {
  String theImage;
  Color couleurDuPrix = Colors.white;
  Color myColor = Colors.white;
  int prix;
  String vip;
  Jeton({
    required this.theImage,
    required this.couleurDuPrix,
    required this.myColor,
    required this.prix,
    required this.vip,
  });

  @override
  Widget build(BuildContext context) {
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
}
