import 'package:appsport_project/bloc/createexoprogrammebloc/createexoprogramme_bloc.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoutonValiderWidget extends StatelessWidget {
  String? cas;
  String? idProgramme;
  int? idExerciceProgramme;
  BoutonValiderWidget({Key? key,this.cas,this.idProgramme,this.idExerciceProgramme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    return BlocBuilder<CreateExoProgrammeBloc, CreateExoProgrammeState>(
      builder: (context, state) {
        if(state is OptionState && state.poids != null && state.poids != "" && state.repetitions != null && state.repetitions != "" && state.exerciceOption != null){
          return InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                    top: 5, bottom: 20, right: 20, left: 20),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(50),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Valider",
                  style: CustomThemes.widgetName,
                  textAlign: TextAlign.center,
                )
            ),
            onTap: () {
              if(cas == "ADD"){
                db
                    .collection('Programme')
                    .doc(idProgramme)
                    .collection('Exercices Programme').get().then((element){
                      int number = 0;
                      int numberStock;
                      for(var docSnapshot in element.docs){
                        numberStock = int.parse(docSnapshot.id);
                        if(number < numberStock){
                          number = numberStock+1;
                        }
                      }
                      var serie = state.serie?.toInt() ?? 1;
                      for(var i=0; i <serie; i++){
                        db
                            .collection('Programme')
                            .doc(idProgramme)
                            .collection('Exercices Programme').doc('$number')
                            .set({
                          'id' : number,
                          'nomExercice' : state.exerciceOption,
                          'nomMuscle' : state.nomMuscle,
                          'poids' : state.poids,
                          'repetitions' : state.repetitions
                        });
                        number = number+1;
                      }
                });
              }
              else if(cas == "UPDATE"){
                if(state.nomMuscle != null){
                  print("UPDATE CAS 1");
                  db
                      .collection('Programme')
                      .doc(idProgramme)
                      .collection('Exercices Programme')
                      .doc('$idExerciceProgramme').update({
                    'nomMuscle' : state.nomMuscle,
                    'nomExercice' : state.exerciceOption,
                    'poids' : state.poids,
                    'repetitions' : state.repetitions
                  });
                }else{
                  print('UPDATE cas 2');
                  db
                      .collection('Programme')
                      .doc(idProgramme)
                      .collection('Exercices Programme')
                      .doc('$idExerciceProgramme').update({
                    'poids' : state.poids,
                    'repetitions' : state.repetitions
                  });
                }
              }
              Navigator.pop(context);
            },
          );
        }
        return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(
                top: 5, bottom: 20, right: 20, left: 20),
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(
                color: Colors.red.withAlpha(50),
                borderRadius: BorderRadius.circular(50)),
            child: Text(
              "Valider",
              style: CustomThemes.widgetName,
              textAlign: TextAlign.center,
            )
        );
      },
    );
  }
}
