
import 'dart:math';

import 'package:appsport_project/bloc/createexoprogrammebloc/createexoprogramme_bloc.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaseWidgetExoProg extends StatelessWidget {
  String? idProgramme;
  int? id;
  String? idExercice;
  String? nomExerice;
  String? nomMuscle;
  String? poids;
  String? repetitions;
  CaseWidgetExoProg({Key? key,this.idProgramme,this.id,this.idExercice,this.nomExerice,this.nomMuscle,this.poids,this.repetitions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> tabColors = [Colors.redAccent,Colors.blueAccent,Colors.greenAccent,Colors.purpleAccent,Colors.amberAccent,Colors.pinkAccent];
    int randomNumberColor = Random().nextInt(5);
    return Container(
      //height: 250,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: tabColors[randomNumberColor].withAlpha(30),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  margin: const EdgeInsets.only(top: 40),
                  width: 150,
                  height: 90,
                  child: Text(nomExerice!,style: CustomThemes.widgetName,),
              ),
              Column(
                children: [
                  Container(
                    width: 150,
                    height: 40,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13)
                    ),
                    child: Text("$poids KG",style: CustomThemes.descriptifTitle,textAlign: TextAlign.center,),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: 120,
                    height: 40,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13)
                    ),
                    child: Text("$repetitions Rep",style: CustomThemes.descriptifTitle,textAlign: TextAlign.center),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(image: AssetImage("assets/images/$nomMuscle.png"),width: 100,height: 100,),
              const SizedBox(height: 20,),
              InkWell(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 60,
                  height: 40,
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: const Image(image: AssetImage("assets/images/stylo.png"),),
                ),
                onTap: (){
                  context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(poids: poids, repetitions: repetitions, exerciceOption: nomExerice));
                  Navigator.pushNamed(
                      context,
                      "exoprogramme",
                      arguments: {
                        'id':id,
                        'idExercice':idExercice,
                        'idProgramme':idProgramme,
                        'nomExercice' : nomExerice,
                        'poids' : poids,
                        'repetitions' : repetitions,
                        'cas':'UPDATE'}
                  );
                },
              ),
              const SizedBox(height: 10,),
              InkWell(
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.only(top: 10),
                  child: const Icon(
                    Icons.maximize_rounded,
                    color: Colors.red,
                  ),
                ),
                onTap: (){
                  showDialog(context: context,
                      builder: (context) => SimpleDialog(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        contentPadding: const EdgeInsets.all(20),
                        title: Text('Programme à supprimer'),
                        children: [
                          const Text("Veux-tu vraiment supprimer ?"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                  onPressed: (){
                                    var db = FirebaseFirestore.instance;
                                    db.collection("Programme").doc(idProgramme).collection("Exercices Programme").doc('$id').delete();
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Confirmer")
                              ),
                              const SizedBox(width: 40,),
                              TextButton(
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text("Annuler")
                              ),
                            ],
                          )
                        ],
                      ));
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
