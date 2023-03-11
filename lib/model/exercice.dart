import 'package:cloud_firestore/cloud_firestore.dart';

class Exercice {
  final String? id;
  final String? idmuscle;
  final String? idUser;
  final String? nomMuscle;
  final String? type;
  final String? nom;

  Exercice({
    this.id,
    this.idmuscle,
    this.nom,
    this.idUser,
    this.type,
    this.nomMuscle
  });

  factory Exercice.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return Exercice(
      id: data?['id'],
      idmuscle: data?['idmuscle'],
      nom: data?['nom'],
      idUser: data?['idUser'],
      type: data?['type'],
      nomMuscle: data?['nomMuscle']
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (idmuscle != null) "idmuscle": idmuscle,
      if (nom != null) "nom": nom,
      if (idUser != null) "idUser": idUser,
      if (nomMuscle != null) "nomMuscle": nomMuscle,
      if (type != null) "type": type,
    };
  }
}