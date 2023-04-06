
import 'package:appsport_project/model/exercice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ExerciceProgramme{
  String? id;
  String? nomExerice;
  String? nomMuscle;
  String? poids;
  String? repetitions;

  ExerciceProgramme({this.id, this.nomExerice, this.nomMuscle, this.poids, this.repetitions});

  factory ExerciceProgramme.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return ExerciceProgramme(
        id: data?['id'],
        nomExerice: data?['nomExerice'],
        nomMuscle: data?['nomMuscle'],
        poids: data?['poids'],
        repetitions: data?['repetitions'],
    );
  }
  Map<String, dynamic> toFirestore() {
    return {
      if (id != null) "id": id,
      if (nomExerice != null) "nomExerice": nomExerice,
      if (nomMuscle != null) "nomMuscle": nomMuscle,
      if (poids != null) "poids": poids,
      if (repetitions != null) "repetitions": repetitions,
    };
  }
}