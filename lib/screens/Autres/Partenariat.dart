import 'package:flutter/material.dart';

import 'package:zid/screens/home/secondScreen.dart';

class partenariat extends StatelessWidget {
  String uid;
  partenariat({required this.uid});
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
        body: SingleChildScrollView(
            child: Container(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Partenariat",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                        SizedBox(
                          height: 20,
                        ),
                        //1
                        Row(children: [
                          Image.asset(
                            'assets/amazon.png',
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            'assets/amazon.png',
                            width: 150,
                            height: 150,
                          ),
                        ]),
                        //2
                        Row(children: [
                          Image.asset(
                            'assets/logo.png',
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            'assets/logo.png',
                            width: 150,
                            height: 150,
                          ),
                        ]),
                        //3
                        Row(children: [
                          Image.asset(
                            'assets/M.png',
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(width: 20),
                          Image.asset(
                            'assets/M.png',
                            width: 150,
                            height: 150,
                          ),
                        ]),
                        //4
                        Row(children: [
                          Image.asset(
                            'assets/Audi.png',
                            width: 150,
                            height: 150,
                          ),
                          SizedBox(width: 20),
                          Container(
                            child: Image.asset(
                              'assets/Audi.png',
                              width: 150,
                              height: 150,
                            ),
                          ),
                        ]),
                      ],
                    )))));
  }
}
