// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:zid/services/database.dart';
// import 'package:zid/model/Products.dart';

// class AuthentificationService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   //registration with email and password
//   Future createNewUser(
//       String firstName,
//       String secondName,
//       String email,
//       String password,
//       int numTel,
//       String region,
//       String pseudo,
//       List<Products> listEncheres,
//       List<Products> listfavoris) async {
//     try {
//       //create a new user authentification
//       UserCredential result = await _auth.createUserWithEmailAndPassword(
//           email: email, password: password);
//       User? user = result.user;
//       //create a new line in the database
//       await DatabaseService(uid: user!.uid).updateUserData(
//           firstName,
//           secondName,
//           email,
//           password,
//           numTel,
//           region,
//           pseudo,
//           listEncheres,
//           listfavoris);
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'database.dart';
import 'package:zid/model/Products.dart';

class AuthentificationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //registration with email and password
  Future createNewUser(
      String nom,
      String prenom,
      String email,
      String motDePasse,
      int numTel,
      String region,
      String pseudo,
      List<Products> listEncheres,
      List<Products> listfavoris) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: motDePasse);
      User? user = result.user;
      await DatabaseService(uid: user!.uid).updateUserData(nom, prenom, email,
          motDePasse, numTel, region, pseudo, listEncheres, listfavoris);
      return user.uid;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  //signin with email and password
  //FirebaseUser user = result.user;
  Future signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return user;
      //I have to return the user uid !!!!
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  //signout
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
