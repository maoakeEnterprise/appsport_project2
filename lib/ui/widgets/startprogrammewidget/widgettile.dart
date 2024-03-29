import 'package:appsport_project/bloc/startprogrammebloc/startprogramme_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class WidgetTile extends StatelessWidget {
  String? nomExercice;
  String? poids;
  String? repetition;
  int? id;

  WidgetTile({Key? key, this.nomExercice, this.poids, this.repetition,this.id})
      : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    bool valueCheckBox = false;
    int cas = 0;
    List<int> listId = [];
    return BlocBuilder<StartProgrammeBloc, StartProgrammeState>(
      builder: (context, state) {
        if (state is InitCheckedBoxState) {
          valueCheckBox = false;
        }
        if (state is GetCheckedBoxState) {
          state.listId.forEach((element) {
            if(id! == element){
              valueCheckBox = true;
              cas = 1;
            }
          });
        }
        if (cas == 1) {
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
                      listId = state.listId;
                      listId.add(id!);
                      context
                          .read<StartProgrammeBloc>()
                          .add(BoxGetCheckedEvent(nomExercice: nomExercice,id: id,listId: listId));
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
                widgetTimer(gainageIsThere(nomExercice!))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget widgetTimer(bool validity) {
    if (validity) {
      return Container(
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
      );
    }
    return Container(
      margin: const EdgeInsets.all(20),
      width: 50,
      height: 50,
    );
  }

  void sendToDataSuivie() {
    int poidsFromDataBase;
    int poidsFromApplication = int.parse(poids!);
    final data = {
      'jour': DateTime.now().day,
      'mois': DateTime.now().month,
      'annee': DateTime.now().year,
      'idUser': user.uid,
      'nomExercice': nomExercice,
      'poids': int.parse(poids!)
    };
    var dbDataSuivie = FirebaseFirestore.instance;
    dbDataSuivie.collection('datasuivie')
        .where('idUser', isEqualTo: user.uid)
        .where('jour', isEqualTo: DateTime.now().day)
        .where('mois', isEqualTo: DateTime.now().month)
        .where('annee', isEqualTo: DateTime.now().year)
        .where("nomExercice", isEqualTo: nomExercice).get()
        .then((querySnapshot) {
          int counter = 0;
      for (var element in querySnapshot.docs) {
        counter++;
        poidsFromDataBase = element['poids'];
        if (poidsFromApplication > poidsFromDataBase) {
          dbDataSuivie
              .collection('datasuivie')
              .doc(element.id)
              .update({'poids': poidsFromApplication});
        }
      }
      if(counter == 0){
        print("test");
        dbDataSuivie.collection('datasuivie').add(data);
      }
    });
  }

  bool gainageIsThere(String words) {
    bool verify = false;
    var tabWord = words.split(' ');
    for (var word in tabWord) {
      var w = word.toLowerCase();
      if (w == 'gainage') {
        verify = true;
      }
    }
    return verify;
  }
}
