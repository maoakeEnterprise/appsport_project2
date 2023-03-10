import 'package:cloud_firestore/cloud_firestore.dart';

class Muscle{
  String? id;
  String? nom;
  String? type;

  Muscle({this.id,this.nom,this.type});

  factory Muscle.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ){
    final data = snapshot.data();
    return Muscle(
      id: data?['id'],
      nom: data?['nom'],
      type: data?['type'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "name": id,
      if (type != null) "state": type,
      if (nom != null) "country": nom,
    };
  }



}