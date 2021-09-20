import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:zid/screens/profile/seConnecter.dart';
import 'package:zid/services/authentification.dart';
import 'package:zid/services/database.dart';

class AdminPage extends StatefulWidget {
  State<StatefulWidget> createState() => AdminPageState();
}

List userData = [];
final CollectionReference userbaseRef =
    FirebaseFirestore.instance.collection('users');

Future<List> read() async {
  QuerySnapshot querySnapshot;
  List docs = [];
  try {
    querySnapshot = await userbaseRef.get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs.toList()) {
        Map a = {
          "nom": doc['firstName'],
          "prenom": doc['secondName'],
          "id": doc.id
        };
        docs.add(a);
      }
      return docs;
    }
    return docs;
  } catch (e) {
    return docs;
  }
}

class AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    setState(() {
      read().then((value) => setState(() {
            userData = value;
          }));
    });
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text("Welcome admin")),
          actions: [
            IconButton(
                icon: Icon(Icons.logout),
                onPressed: () {
                  logoutUser();
                })
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < userData.length; i++)
              Row(children: [
                Text(userData[i]['nom'] + ' ' + userData[i]['prenom']),
                SizedBox(width: 30),
                TextButton(
                  child: Text('Delete', style: TextStyle()),
                  onPressed: () {
                    deleteUserById(userData[i]['id']);
                  },
                )
              ]),
          ],
        ));
  }

  void logoutUser() async {
    AuthentificationService _auth = AuthentificationService();
    await _auth.signOut();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SeConnecter()),
    );
  }

  void deleteUserById(String idUser) {
    DatabaseService ds = DatabaseService(uid: idUser);
    ds.deleteUserWithGivenID(idUser);
  }
}
