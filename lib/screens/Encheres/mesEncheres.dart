import 'package:cloud_firestore/cloud_firestore.dart';
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
                  StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(uid)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return new Text("Loading");
                        }
                        DocumentSnapshot<Object?> documentData =
                            snapshot.data as DocumentSnapshot;

                        if (documentData['encheres'] != null) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for (var x = 0;
                                  x < documentData['encheres'].length;
                                  x++)
                                Column(children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  deatilsEncheres(
                                    imageProduit: documentData['encheres'][x]
                                        ['imageProduit'],
                                    nomProduit: documentData['encheres'][x]
                                        ['nomProduit'],
                                    date: documentData['encheres'][x]['date'],
                                    avancement: documentData['encheres'][x]
                                            ['avancement']
                                        .toString(),
                                  )
                                ])
                            ],
                          );
                        } else {
                          return Center(
                              child:
                                  Stack(alignment: Alignment.center, children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                    height: 66,
                                    width: 63,
                                    color: Colors.white)),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.red.shade300)),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                    height: 55,
                                    width: 55,
                                    color: Colors.red.shade100)),
                            Icon(Icons.notifications, color: Colors.grey)
                          ]));
                        }
                      }),
                ])))));
  }
}
