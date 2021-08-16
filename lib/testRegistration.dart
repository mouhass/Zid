import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zid/model/Users.dart';
import 'package:zid/services/authentification.dart';
import 'package:zid/model/Products.dart';

class TestRegest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestRegestState();
}

class TestRegestState extends State<TestRegest> {
  String firstName = "";
  String SecondName = "";
  String email = "";
  String password = "";

  final AuthentificationService _auth = AuthentificationService();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Test")),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val != null) {
                            if (val.isEmpty) {
                              return ('Enter your name');
                            } else {
                              return (null);
                            }
                          }
                        },
                        onChanged: (val) {
                          setState(() => firstName = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val != null) {
                            if (val.isEmpty) {
                              return ('Enter your name');
                            } else {
                              return (null);
                            }
                          }
                        },
                        onChanged: (val) {
                          setState(() => SecondName = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val != null) {
                            if (val.isEmpty) {
                              return ('Enter your name');
                            } else {
                              return (null);
                            }
                          }
                        },
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        validator: (val) {
                          if (val != null) {
                            if (val.isEmpty) {
                              return ('Enter your name');
                            } else {
                              return (null);
                            }
                          }
                        },
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                          color: Colors.pink[400],
                          child: Text('Regester',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          onPressed: () async {
                            Users newuser = Users(
                                UserFirstName: firstName,
                                UserLastName: SecondName,
                                email: email,
                                password: password,
                                numeroTel: 23409234,
                                region: "mahdia",
                                pseudo: "5anchour",
                                listEncheres: [],
                                listFavoris: []);
                            createUser(
                                newuser.UserFirstName,
                                newuser.UserLastName,
                                newuser.email,
                                newuser.password,
                                newuser.numeroTel,
                                newuser.region,
                                newuser.pseudo,
                                newuser.listEncheres,
                                newuser.listFavoris);
                          }),
                    ],
                  ),
                ))));
  }

  void createUser(
      String firstName,
      String lastName,
      String email,
      String password,
      int numTel,
      String region,
      String pseudo,
      List<Products> listEncheres,
      List<Products> listfavoris) async {
    dynamic result = await _auth.createNewUser(firstName, lastName, email,
        password, numTel, region, pseudo, listEncheres, listfavoris);
  }
}
