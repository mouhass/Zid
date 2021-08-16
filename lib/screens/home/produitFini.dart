import 'package:flutter/material.dart';

class ProduitFini extends StatelessWidget {
  String imageProduit = '';
  String nomProduit = "";
  String quiRemporte = "";
  ProduitFini(
      {required this.imageProduit,
      required this.nomProduit,
      required this.quiRemporte});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image(
                  image: AssetImage('assets/Rectangle 268.png'),
                  height: 230,
                  width: 140,
                  fit: BoxFit.cover,
                )),
            Positioned(
              top: 63,
              left: 10,
              child: Image.asset(imageProduit, width: 120.0, height: 130.0),
            ),
            Positioned(
                top: 90,
                left: 13,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Stack(
                      children: [
                        Container(
                            width: 116,
                            height: 40,
                            color: Color(0XFFE25033),
                            child: Center(
                              child: Text("Remporté à \n 141.60DT",
                                  style: const TextStyle(color: Colors.white)),
                            )),
                      ],
                    ))),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nomProduit, style: const TextStyle(fontSize: 15)),
            SizedBox(height: 6),
            Row(children: [
              Text("Remporté par "),
              Text(quiRemporte, style: const TextStyle(color: Colors.red)),
            ]),
            SizedBox(height: 6),
            Row(children: [
              Text("à "),
              Text("141.60 Dt",
                  style: const TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)),
              Text(" au lieu de"),
              Text(" 549DT",
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough)),
            ]),
            SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () {},
              child: Container(
                  width: 180,
                  child: Center(
                      child: Wrap(children: [
                    Image(
                        image: AssetImage(
                            'assets/Icon ionic-ios-share-alt@1X.png')),
                    SizedBox(width: 10),
                    Text(
                      "Pratager",
                      style: TextStyle(color: Colors.black, fontSize: 11),
                    )
                  ]))),
              style: ButtonStyle(
                  side: MaterialStateProperty.all(
                      BorderSide(width: 1.5, color: Colors.black)),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ))),
            ),
            Container(height: 40),
          ],
        )
      ],
    );
  }
}
