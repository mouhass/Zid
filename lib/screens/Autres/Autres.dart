import 'package:flutter/material.dart';
import 'package:zid/screens/Autres/InformationSecurite.dart';
import 'package:zid/screens/Autres/MentionLegale.dart';
import 'package:zid/screens/Autres/Partenariat.dart';
import 'package:zid/screens/profile/monProfile.dart';
import 'package:zid/screens/Autres/termesConditions.dart';
import 'package:url_launcher/url_launcher.dart';

class Autres extends StatelessWidget {
  String uid;
  Autres({required this.uid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Image(image: AssetImage('assets/Logo@1X.png')),
          backgroundColor: Colors.white,
        ),
        body: Container(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Autres",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
              SizedBox(
                height: 20,
              ),

              //1
              TextButton(
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Text("Partenariat",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                    SizedBox(width: 160),
                    Image.asset('assets/AutresArrow.png')
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return partenariat(uid: uid);
                  }));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
              ),
              SizedBox(
                height: 10,
              ),
              //2
              TextButton(
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Text("Comment ça marche",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                    SizedBox(width: 100),
                    Image.asset('assets/AutresArrow.png')
                  ],
                ),
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
              ),
              SizedBox(
                height: 10,
              ),
              //3
              TextButton(
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Text("Information de sécurité",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                    SizedBox(width: 84),
                    Image.asset('assets/AutresArrow.png')
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return InfromationSecurite(
                      uid: uid,
                    );
                  }));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
              ),
              SizedBox(
                height: 10,
              ),
              //3
              TextButton(
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Text("Termes et conditions",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                    SizedBox(width: 98),
                    Image.asset('assets/AutresArrow.png')
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return termesConditions(uid: uid);
                  }));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Text("Mention légales",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w400)),
                    SizedBox(width: 130),
                    Image.asset('assets/AutresArrow.png')
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return MentionsLegales(
                      uid: uid,
                    );
                  }));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.grey.shade300),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ))),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Restez connecté",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(alignment: Alignment.center, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                            height: 50, width: 50, color: Color(0XFF1976D2))),
                    IconButton(
                      icon: Image.asset('assets/Path 839.png'),
                      onPressed: () {
                        link1();
                      },
                    ),
                  ]),
                  SizedBox(width: 20),
                  Stack(alignment: Alignment.center, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                            height: 50, width: 50, color: Color(0XFF03A9F4))),
                    IconButton(
                      icon: Image.asset('assets/Path 833.png'),
                      onPressed: () {},
                    ),
                  ]),
                  SizedBox(width: 20),
                  Stack(alignment: Alignment.center, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                            height: 50, width: 50, color: Color(0XFFF86661))),
                    IconButton(
                      icon: Image.asset('assets/Group 409.png'),
                      onPressed: () {
                        link2();
                      },
                    ),
                  ]),
                  SizedBox(width: 20),
                  Stack(alignment: Alignment.center, children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(80),
                        child: Container(
                            height: 50, width: 50, color: Color(0XFF1A7EC1))),
                    IconButton(
                      icon: Image.asset('assets/Group 408.png'),
                      onPressed: () {},
                    ),
                  ]),
                ],
              )
            ],
          ),
        )));
  }
}

link1() {
  String url1 = "https://www.facebook.com/zid.tn";
  launch(url1);
}

link2() {
  String url1 = "https://www.instagram.com/zid.tn/?hl=fr";
  launch(url1);
}
