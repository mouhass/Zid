import 'package:flutter/material.dart';
import 'package:zid/screens/home/secondScreen.dart';
import 'package:zid/services/authentification.dart';
import 'package:zid/screens/profile/sinscrire.dart';

class SeConnecter extends StatefulWidget {
  State<StatefulWidget> createState() => SeConnecterState();
}

class SeConnecterState extends State<SeConnecter> {
  AuthentificationService _auth = AuthentificationService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String email = "";
  String motDePasse = "";
  bool _isObscure = true;
  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
      ),
      onChanged: (val) {
        email = val;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPassword() {
    return TextField(
      obscureText: _isObscure,
      onChanged: (val) {
        motDePasse = val;
      },
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
              icon: Icon(_isObscure ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              })),
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Center(child: Image.asset('assets/Logo@1X.png')),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Text("Connectez-vous",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  height: 220,
                  color: Colors.lightBlue[50],
                  margin: EdgeInsets.all(6),
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Form(
                              key: _formKey,
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    _buildEmail(),
                                    _buildPassword(),
                                    SizedBox(height: 20),
                                  ])))))),
          TextButton(
            child: Container(
                width: w - 60,
                child: Center(
                  child: Text("Se connecter",
                      style: TextStyle(color: Colors.white)),
                )),
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return MyHomePage();
              // }));
              signInUser();
            },
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade300),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ))),
          ),
          SizedBox(
            height: 5,
          ),
          Center(
              child: Container(
                  child: Row(
            children: [
              SizedBox(width: 70),
              Text(
                "Vous avez déjà un compte?",
                style: TextStyle(fontSize: 12),
              ),
              TextButton(
                child: Text(
                  "Créer un nouveau",
                  style: TextStyle(color: Colors.blue, fontSize: 12),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Sinscrire();
                  }));
                },
              )
            ],
          )))
        ])));
  }

  void signInUser() async {
    dynamic result = await _auth.signIn(email, motDePasse);
    if (result != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MyHomePage(uid: result.uid)),
      );
    }
  }
}
