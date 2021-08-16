import 'package:flutter/material.dart';
import 'package:zid/screens/jetons/jeton.dart';
import 'package:zid/screens/profile/monProfile.dart';

class ContenuAchatJeton extends StatelessWidget {
  String uid;
  ContenuAchatJeton({required this.uid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Image(image: AssetImage('assets/Logo@1X.png')),
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Image.asset('assets/avatar.png'),
                color: Colors.orange,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MonProfile(uid: uid);
                  }));
                },
              ),
            ]),
        body: Container(
          child: SingleChildScrollView(
              child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(children: [
                SizedBox(width: 10),
                Text("Achat de jetons",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Container(width: 0)
              ]),
              SizedBox(
                height: 20,
              ),

              Jeton(
                  theImage: 'assets/PACK 50 CLICS.png',
                  couleurDuPrix: Colors.white,
                  myColor: Color(0XFF0E214D),
                  prix: 100,
                  vip: 'assets/vip.png'),
              //la fin du premier jeton
              //debut du second jeton
              SizedBox(
                height: 20,
              ),
              Jeton(
                  theImage: 'assets/PACK 100 CLICS.png',
                  couleurDuPrix: Colors.white,
                  myColor: Color(0XFF0E214D),
                  prix: 200,
                  vip: 'assets/vip.png'),
              //fin du seond
              //debut du 3ème
              SizedBox(
                height: 20,
              ),
              Jeton(
                  theImage: 'assets/PACK 5 CLICS.png',
                  couleurDuPrix: Colors.black,
                  myColor: Color(0XFFD9D9D9),
                  prix: 7,
                  vip: 'assets/cc.png'),
              //fin du 3ème
              //debut 4ème
              SizedBox(
                height: 20,
              ),
              Jeton(
                  theImage: 'assets/PACK 5 CLICS.png',
                  couleurDuPrix: Colors.black,
                  myColor: Color(0XFFD9D9D9),
                  prix: 13,
                  vip: 'assets/cc.png'),
              //debut 5ème
              SizedBox(
                height: 20,
              ),
              Jeton(
                  theImage: 'assets/PACK 15 CLICS.png',
                  couleurDuPrix: Colors.black,
                  myColor: Color(0XFFD9D9D9),
                  prix: 19,
                  vip: 'assets/cc.png'),
              //debut 6ème
              SizedBox(
                height: 20,
              ),
              Jeton(
                  theImage: 'assets/PACK 20 CLICS.png',
                  couleurDuPrix: Colors.black,
                  myColor: Color(0XFFD9D9D9),
                  prix: 25,
                  vip: 'assets/cc.png'),
              //debut 7ème
              SizedBox(
                height: 20,
              ),
              Jeton(
                  theImage: 'assets/PACK 25 CLICS.png',
                  couleurDuPrix: Colors.black,
                  myColor: Color(0XFFD9D9D9),
                  prix: 30,
                  vip: 'assets/cc.png'),
            ],
          )),
        ));
  }
}
