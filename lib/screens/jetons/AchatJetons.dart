import 'package:flutter/material.dart';

import 'package:zid/screens/jetons/contenuAchatJeton.dart';

class AchatDeJetons extends StatefulWidget {
  String uid;
  AchatDeJetons({required this.uid});
  @override
  _AchatDeJetonsState createState() => _AchatDeJetonsState(uid: uid);
}

class _AchatDeJetonsState extends State<AchatDeJetons> {
  String uid;
  _AchatDeJetonsState({required this.uid});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ContenuAchatJeton(uid: uid));
  }
}
