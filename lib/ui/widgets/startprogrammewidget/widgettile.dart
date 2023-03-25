import 'package:appsport_project/bloc/startprogrammebloc/startprogramme_bloc.dart';
import 'package:appsport_project/bloc/startprogrammebloc/startprogramme_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetTile extends StatelessWidget {
  String? nomExercice;
  String? poids;
  String? repetition;

  WidgetTile({Key? key, this.nomExercice, this.poids, this.repetition})
      : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    bool valueCheckBox = false;
    int cas = 0;
    if (gainageIsThere(nomExercice!)) {
      return BlocBuilder<StartProgrammeBloc, StartProgrammeState>(
        builder: (context, state) {
          if(state is InitCheckedBoxState){valueCheckBox = false;}
          if(state is GetCheckedBoxState){
            if(valueCheckBox == false && state.nomExercice == nomExercice){
              valueCheckBox = true;
              cas = 1;
            }
          }
          if(cas == 1){
            return Container();
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                //border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 4,
                    offset: Offset(2, 2), // Shadow position
                  ),
                ],
              ),
              child: Row(
                children: [
                  Checkbox(
                      checkColor: Colors.white,
                      value: valueCheckBox,
                      onChanged: (value) {
                        context.read<StartProgrammeBloc>().add(BoxGetCheckedEvent(nomExercice: nomExercice));
                        print(getDateInMap());
                        print('Nom Exercice: $nomExercice');
                        print('Poids : $poids');
                        print('Utilisateur: ${user.uid}');
                        sendToDataSuivie();
                      }),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(nomExercice!),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Poids: $poids'),
                              Text('Répétitions: $repetition'),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(20),
                    width: 50,
                    height: 50,
                    child: IconButton(
                      icon: const Icon(Icons.access_alarm_rounded),
                      tooltip: 'Set Up your timer',
                      onPressed: () {
                        print(gainageIsThere(nomExercice!));
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }
    return BlocBuilder<StartProgrammeBloc, StartProgrammeState>(
      builder: (context, state) {
        if(state is InitCheckedBoxState){valueCheckBox = false;}
        if(state is GetCheckedBoxState){
          if(valueCheckBox == false && state.nomExercice == nomExercice){
            valueCheckBox = true;
            cas = 1;
          }
        }
        if(cas == 1){
          return Container();
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 4,
                  offset: Offset(2, 2), // Shadow position
                ),
              ],
            ),
            child: Row(
              children: [
                Checkbox(
                    checkColor: Colors.white,
                    value: valueCheckBox,
                    onChanged: (value) {
                      context.read<StartProgrammeBloc>().add(BoxGetCheckedEvent(nomExercice: nomExercice));
                      print(getDateInMap());
                      print('Nom Exercice: $nomExercice');
                      print('Poids : $poids');
                      print('Utilisateur: ${user.uid}');
                      sendToDataSuivie();
                    }),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(nomExercice!),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Poids: $poids'),
                            Text('Répétitions: $repetition'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(20),
                  width: 50,
                  height: 50,
                )
              ],
            ),
          ),
        );
      },
    );
  }




  void sendToDataSuivie(){
    final data = {
      'date' : getDateInMap(),
      'idUser' : user.uid,
      'nomExercice' : nomExercice,
      'poids' : poids
    };
    var dbDataSuivie = FirebaseFirestore.instance;
    dbDataSuivie.collection('datasuivie').add(data);
  }


  Map<String, int> getDateInMap() {
    Map<String, int> date;
    date = {
      'jour': DateTime.now().day,
      'mois': DateTime.now().month,
      'annee': DateTime.now().year,
    };
    return date;
  }

  bool gainageIsThere(String words) {
    bool verify = false;
    var tabWord = words.split(' ');
    tabWord.forEach((word) {
      var w = word.toLowerCase();
      if (w == 'gainage') {
        verify = true;
      }
    });
    return verify;
  }
}
