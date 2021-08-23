import 'package:zid/model/Products.dart';

class Users {
  final String UserFirstName;
  final String UserLastName;
  final String region;
  final String email;
  final String password;
  final int numeroTel;
  final String pseudo;
  final List<Products> listEncheres;
  final List<Products> listFavoris;

  Users(
      {required this.UserFirstName,
      required this.UserLastName,
      required this.region,
      required this.email,
      required this.password,
      required this.numeroTel,
      required this.pseudo,
      required this.listEncheres,
      required this.listFavoris});

  Map<String, dynamic> encheresItems(
      String imageProduit, String nomProduit, String date, String avancement) {
    return {
      "imageProduit": imageProduit,
      'nomProduit': nomProduit,
      "date": date,
      "avancement": avancement,
    };
  }
}
