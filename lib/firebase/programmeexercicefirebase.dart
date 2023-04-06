import 'package:appsport_project/ui/widgets/programmewidget/casewidgetexoprog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProgrammeExerciceFirebase extends StatelessWidget {
  String? id;

  ProgrammeExerciceFirebase({Key? key, this.id}) : super(key: key);

  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var dataProgramme = db
        .collection('Programme')
        .doc(id)
        .collection('Exercices Programme')
        .orderBy('id')
        .snapshots();
    return Expanded(
      child: StreamBuilder(
          stream: dataProgramme,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasError){
              return const Text('Error');
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return const CircularProgressIndicator();
            }
            return ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document){
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                if(data['id'] == "0") return Container();
                return CaseWidgetExoProg(
                  idProgramme: id,//ID DU PROGRAMME
                  id: data['id'],
                  idExercice: data['idExercice'],
                  nomExerice: data['nomExercice'],
                  nomMuscle: data['nomMuscle'],
                  poids: data['poids'],
                  repetitions: data['repetitions'],
                );
              }).toList(),
            );
          }),
    );
  }
}
