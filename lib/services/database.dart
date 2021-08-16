import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zid/model/Products.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  //collection reference
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future updateUserData(
      String firstName,
      String secondName,
      String email,
      String password,
      int numTel,
      String region,
      String pseudo,
      List<Products> listEncheres,
      List<Products> listfavoris) async {
    return await usersCollection.doc(uid).set({
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
      'password': password,
      'numTel': numTel,
      'region': region,
      'pseudo': pseudo,
      'listEncheres': listEncheres,
      'listfavoris': listfavoris
    });
  }
}
