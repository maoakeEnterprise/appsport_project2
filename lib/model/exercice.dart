import 'package:cloud_firestore/cloud_firestore.dart';

class Exercice {
  final String? id;
  final String? idmuscle;
  final String? nom;

  Exercice({
    this.id,
    this.idmuscle,
    this.nom,
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
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "name": id,
      if (idmuscle != null) "state": idmuscle,
      if (nom != null) "country": nom,
    };
  }
}