import 'package:flutter/material.dart';
import 'package:zid/screens/home/secondScreen.dart';
import 'package:zid/services/signIn.dart';
import 'package:zid/services/database.dart';
import 'package:provider/provider.dart';

class Test extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TestState();
}

class TestState extends State<Test> {
  final SignIn _auth = SignIn();
  String hello = "";
  String email = "";
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Test")),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (val) {
                      setState(() => email = val);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
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
                      child: Text('sign in',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      onPressed: () async {
                        dynamic result = await _auth.signInWithEmailAndPassword(
                            email, password);

                        print(email);
                        print(password);
                        print(result.toString());
                        if (result == null) {
                          setState(() {
                            hello = "erreur de connexion";
                          });
                        } else {
                          setState(() {
                            hello = "wilyee";
                            // if (result['typeUser'] == "fournisseur") {
                            //   Navigator.push(context,
                            //       MaterialPageRoute(builder: (context) {
                            //     return MyHomePage();
                            //   }));
                            // }
                          });
                        }
                      }),
                  Text(hello, style: TextStyle(color: Colors.red))
                ],
              ),
            )));
  }
}
