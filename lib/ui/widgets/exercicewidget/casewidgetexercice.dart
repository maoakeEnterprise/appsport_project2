import 'dart:math';

import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaseWidgetExercice extends StatelessWidget {
  String? nom;
  String? nomMuscle;
  String? idMuscle;
  String? id;
  String? type;

  CaseWidgetExercice({Key? key,this.nom,this.nomMuscle,this.id,this.idMuscle,this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> tabColors = [Colors.redAccent,Colors.blueAccent,Colors.greenAccent,Colors.purpleAccent,Colors.amberAccent,Colors.pinkAccent];
    int randomNumberColor = Random().nextInt(5);
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: tabColors[randomNumberColor].withAlpha(30),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 200,
                    child: Text(nom!,style: CustomThemes.secondTypeTitle,),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(15),

                      child: Container(
                        width: 60,
                        height: 40,
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: const Image(image: AssetImage("assets/images/stylo.png"),),
                      ),
                      onTap: (){

                        String routeNameNewExercice = 'nouveauexercice';
                        context.read<ExerciceBloc>().add(SearchExoEvent(val: ""));
                        Navigator.pushNamed(context, routeNameNewExercice,arguments: {'nomMuscle': nomMuscle,'id':id,'nom':nom,'type':type,'idMuscle':idMuscle});
                      },
                    ),
                    const SizedBox(width: 30,),
                    InkWell(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
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
                              title: Text(nom!),
                              children: [
                                const Text("Veux-tu vraiment supprimer ?"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                        onPressed: (){
                                          var db = FirebaseFirestore.instance;
                                          db.collection("Exercices").doc(id).delete();
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
                    ),
                  ],
                )
              ],
            ),
          ),

          Expanded(child: Container()),

          SizedBox(
            width: 75,
            height: 75,
            child: Image(image: AssetImage("assets/images/$nomMuscle.png"),),
          ),

        ],
      ),
    );
  }
}