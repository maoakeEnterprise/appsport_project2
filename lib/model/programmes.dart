import 'package:cloud_firestore/cloud_firestore.dart';

class Programme {
  String? id;
  String? idUser;
  String? nom;
  String? validate;

  Programme({this.id, this.idUser, this.nom, this.validate});

  factory Programme.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Programme(
      id: data?['id'],
      nom: data?['nom'],
      idUser: data?['idUser'],
      validate: data?['validate']
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (nom != null) "nom": nom,
      if (idUser != null) "idUser": idUser,
      if (validate != null) "validate": validate,
    };
  }
}
