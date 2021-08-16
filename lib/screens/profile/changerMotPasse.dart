import 'package:flutter/material.dart';
import 'package:zid/screens/home/secondScreen.dart';

class ChangerMotPasse extends StatefulWidget {
  State<StatefulWidget> createState() => ChangerMotPasseState();
}

class ChangerMotPasseState extends State<ChangerMotPasse> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Ancien mot de passe',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildNewPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nouveau mot de passe',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildConfirmPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'COnfirmer mot de passe',
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(child: Image.asset('assets/Logo@1X.png')),
      ),
      body: Column(
        children: [
          Text("Verification de votre email"),
          Text(
              "On va vous envoyer un email de réinitialisation sur votre compte"),
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
                                    _buildPassword(),
                                    _buildNewPassword(),
                                    _buildConfirmPassword(),
                                  ])))))),
          TextButton(
            child: Text("Se connecter"),
            onPressed: () {},
          )
        ],
      ),
    ));
  }
}
