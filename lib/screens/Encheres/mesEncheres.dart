import 'package:flutter/material.dart';
import 'package:zid/screens/Encheres/detailsEncheres.dart';
import 'package:zid/screens/profile/monProfile.dart';

class MesEncheres extends StatefulWidget {
  String uid;
  MesEncheres({required this.uid});
  State<StatefulWidget> createState() => MesEncheresState(uid: uid);
}

class MesEncheresState extends State<MesEncheres> {
  String uid;
  MesEncheresState({required this.uid});
  @override
  Widget build(BuildContext context) {
    List<deatilsEncheres> LesEncheres = [
      deatilsEncheres(
        imageProduit: 'assets/smartWatch.png',
        nomProduit: "HUAWEI SMART WATCH GT2",
        date: "2021-07-21",
        avancement: 45.5,
      ),
      deatilsEncheres(
        imageProduit: 'assets/modifiedphone.png',
        nomProduit: "REDMI 7A BLACK",
        date: "2021-07-22",
        avancement: 14,
      ),
    ];

    Widget showEnchere(int i) {
      return LesEncheres[i];
    }

    return (Scaffold(
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
                    return MonProfile(
                      uid: uid,
                    );
                  }));
                },
              ),
            ]),
        body: Padding(
            padding: EdgeInsets.all(5),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(height: 20),
                  Row(children: [
                    SizedBox(width: 14),
                    Text("Mes enchères",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                  ]),
                  // LesEncheres[0],
                  // LesEncheres[1],

                  showEnchere(0),
                  showEnchere(1),
                ])))));
  }
}
