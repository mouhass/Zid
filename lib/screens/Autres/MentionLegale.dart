import 'package:flutter/material.dart';
import 'package:zid/screens/Autres/Autres.dart';
import 'package:zid/screens/profile/monProfile.dart';
import 'package:zid/screens/home/secondScreen.dart';

class MentionsLegales extends StatelessWidget {
  String uid;
  MentionsLegales({required this.uid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Center(child: Image.asset('assets/Logo@1X.png')),
          actions: [SizedBox(width: 50)],
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MyHomePage(uid: uid);
              }));
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Mention légales",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              SizedBox(
                height: 20,
              ),
              Text(
                " Proin tincidunt imperdiet sapien",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    'vitae tincidunt ipsum suscipit sit amet. Nullam dictum non enim id tristique. Aenean erat augue, vestibulum eu urna non, porta eleifend magna. Quisque nulla sem, mattis eget ante non, condimentum interdum est. Cras porttitor sem id sem rhoncus bibendum. Nulla varius ac lectus sit amet vestibulum. Nam sit amet tempor metus. Phasellus auctor hendrerit fermentum.'),
              ),
              Text(" Curabitur convallis odio ex",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    "sed venenatis turpis fermentum nec. Praesent ut blandit tellus. Fusce efficitur venenatis erat, eget dapibus lorem lacinia ac. Pellentesque gravida id felis vitae consequat. Nam placerat massa vitae tortor eleifend, nec rhoncus urna imperdiet. Suspendisse varius risus et risus dapibus feugiat."),
              ),
              Text(' Proin tincidunt imperdiet sapien',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                    'vitae tincidunt ipsum suscipit sit amet. Nullam dictum non enim id tristique. Aenean erat augue, vestibulum eu urna non, porta eleifend magna. Quisque nulla sem, mattis eget ante non, condimentum interdum est. Cras porttitor sem id sem rhoncus bibendum. Nulla varius ac lectus sit amet vestibulum. Nam sit amet tempor metus. Phasellus auctor hendrerit fermentum.'),
              ),
            ],
          ),
        ));
  }
}
