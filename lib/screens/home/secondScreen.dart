import 'package:flutter/material.dart';

import 'package:zid/screens/Autres/Autres.dart';
import 'package:zid/screens/jetons/contenuAchatJeton.dart';
import 'package:zid/screens/favoris/mesFavoris.dart';

import 'package:zid/screens/home/pageSpeciale.dart';

import 'package:zid/screens/Encheres/mesEncheres.dart';
import 'package:zid/services/authentification.dart';

class MyHomePage extends StatefulWidget {
  String uid;
  MyHomePage({required this.uid});

  @override
  SecondScreen createState() => SecondScreen(uid: this.uid);
}

class SecondScreen extends State<MyHomePage> {
  String uid;
  SecondScreen({required this.uid});
  Color favoriteColor = Colors.grey;

  int _currentIndex = 0;
  void _onItemTap(int index) {
    setState(() {
      _currentIndex = index;
      uid = uid;
    });
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List<Widget> _widgetOptions = <Widget>[
      pageSpeciale(
        uid: uid,
      ),
      MesEncheres(
        uid: uid,
      ),
      ContenuAchatJeton(uid: uid),
      MesFavoris(uid: uid),
      Autres(uid: uid)
    ];

    return Scaffold(
        body: _widgetOptions.elementAt(_currentIndex),
        bottomNavigationBar: Container(
            width: w,
            height: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30), topLeft: Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black38, spreadRadius: 0, blurRadius: 10),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                currentIndex: _currentIndex,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      title: Container(height: 8),
                      icon: Image.asset(
                        'assets/Accueil@1X.png',
                        width: 30,
                        height: 30,
                      ),
                      activeIcon: Stack(alignment: Alignment.center, children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 66, width: 63, color: Colors.white)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 43,
                                width: 43,
                                color: Colors.lightBlue.shade100)),
                        Image.asset(
                          'assets/accueil1.png',
                          width: 25,
                          height: 25,
                        ),
                        Positioned(
                            top: 58,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                    height: 8, width: 8, color: Colors.red))),
                      ])),
                  BottomNavigationBarItem(
                      title: Container(height: 8),
                      icon: Image.asset(
                        'assets/Groupe 460@1X.png',
                        width: 30,
                        height: 30,
                      ),
                      activeIcon: Stack(alignment: Alignment.center, children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 66, width: 63, color: Colors.white)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 43,
                                width: 43,
                                color: Colors.lightBlue.shade100)),
                        Image.asset(
                          'assets/Groupe 460@1X2.png',
                          width: 25,
                          height: 25,
                        ),
                        Positioned(
                            top: 58,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                    height: 8, width: 8, color: Colors.red))),
                      ])),

                  BottomNavigationBarItem(
                      title: Container(height: 8),
                      icon: Stack(alignment: Alignment.center, children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 66, width: 63, color: Colors.white)),
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
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 43, width: 43, color: Colors.red)),
                        Image.asset(
                          'assets/image.png',
                          width: 25,
                          height: 25,
                        ),
                      ]),
                      activeIcon: Stack(alignment: Alignment.center, children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 66, width: 63, color: Colors.white)),
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
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 43, width: 43, color: Colors.red)),
                        Image.asset(
                          'assets/image.png',
                          width: 25,
                          height: 25,
                        ),
                        Positioned(
                            top: 58,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                    height: 8, width: 8, color: Colors.red))),
                      ])),

                  // BottomNavigationBarItem(
                  //     icon: Icon(Icons.favorite_border, color: Colors.black),
                  //     title: Text(''),
                  //     activeIcon:
                  //         Icon(Icons.favorite_border, color: Colors.lightBlue)),
                  BottomNavigationBarItem(
                      title: Container(height: 8),
                      icon: Icon(Icons.favorite_border, color: Colors.black),
                      activeIcon: Stack(alignment: Alignment.center, children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 66, width: 63, color: Colors.white)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 43,
                                width: 43,
                                color: Colors.lightBlue.shade100)),
                        Icon(Icons.favorite_border, color: Colors.lightBlue),
                        Positioned(
                            top: 58,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                    height: 8, width: 8, color: Colors.red))),
                      ])),

                  // BottomNavigationBarItem(
                  //     icon: Icon(Icons.menu, color: Colors.black),
                  //     title: Text(''),
                  //     activeIcon: Icon(Icons.menu, color: Colors.lightBlue)),

                  BottomNavigationBarItem(
                      title: Container(height: 8),
                      icon: Icon(Icons.menu, color: Colors.black),
                      activeIcon: Stack(alignment: Alignment.center, children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 66, width: 63, color: Colors.white)),
                        ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: Container(
                                height: 43,
                                width: 43,
                                color: Colors.lightBlue.shade100)),
                        Icon(Icons.menu, color: Colors.lightBlue),
                        Positioned(
                            top: 58,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(80),
                                child: Container(
                                    height: 8, width: 8, color: Colors.red))),
                      ])),
                ],
                onTap: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            )));
  }
}
