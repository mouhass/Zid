import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zid/screens/profile/monProfile.dart';

class ModifierMesInfos extends StatefulWidget {
  String uid;
  ModifierMesInfos({required this.uid});
  @override
  State<StatefulWidget> createState() {
    return ModifierMesInfosState(uid: this.uid);
  }
}

class ModifierMesInfosState extends State<ModifierMesInfos> {
  String uid;
  ModifierMesInfosState({required this.uid});
  List<DropdownMenuItem<String>> codeList = [];
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nom*',
      ),
    );
  }

//--------------
  Widget _buildPrenom() {
    return TextFormField(decoration: InputDecoration(labelText: 'Prénom*'));
  }

  Widget _buildPseudo() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Pseudo*'),
    );
  }

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Email*'),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPhoneNumber() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Téléphone/Mobile*'),
      keyboardType: TextInputType.phone,
    );
  }

  Widget ff() {
    return Positioned(
      top: 40,
      child: Text(_currentItemSelected),
    );
  }

  Widget _buildRegion() {
    return Stack(children: [
      TextFormField(
        decoration: InputDecoration(labelText: 'Région*', enabled: true),
      ),
      Positioned(
          left: 120,
          top: 20,
          child: DropdownButton<String>(
            items: _regions.map((String dropDownStringItem) {
              return DropdownMenuItem<String>(
                value: dropDownStringItem,
                child: Text(dropDownStringItem),
              );
            }).toList(),
            onChanged: (String? newvalueSelected) {
              if (newvalueSelected != "") {
                _currentItemSelected = newvalueSelected.toString();
                print(_currentItemSelected);
              } else {
                _currentItemSelected = "";
              }
            },
          )),
      ff(),
    ]);
  }

  var _regions = [
    'Mahdia',
    'Sousse',
    'Sfax',
    'Tunis',
    'Nabeul',
    'Ben Arous',
    'Ben guirden',
    'Mednine',
    'Tatouine',
    'Tozeur',
    'Kef',
    'Bizert',
    'Kairouan',
    'Gafsa',
    'Ain drahem',
    'Ariana',
    'Manouba',
    'Béja',
    'Gabes',
    'Jendouba',
    'Kasserine',
    'Kbéli',
    'Monastir',
    'Sidi bouzid',
  ];
  var _currentItemSelected = '';

  Widget _buildPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Mot de passe*'),
      keyboardType: TextInputType.visiblePassword,
    );
  }

  Widget _buildConfPassword() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(labelText: 'Confirmer mot de passe*'),
      keyboardType: TextInputType.visiblePassword,
    );
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Text("Modifier mes informations",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
          Padding(
              padding: EdgeInsets.all(20),
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.all(6),
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          _buildName(),
                          _buildPrenom(),
                          _buildPseudo(),
                          _buildEmail(),
                          _buildPhoneNumber(),
                          _buildRegion(),
                        ],
                      ),
                    ),
                  ))),
          TextButton(
            child: Container(
                width: w - 60,
                child: Center(
                  child: Text("Mettre à jour",
                      style: TextStyle(color: Colors.white)),
                )),
            onPressed: () {},
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.red.shade300),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ))),
          ),
        ]),
      ),
    );
  }
}
