import 'dart:math';

import 'package:appsport_project/bloc/startprogrammebloc/startprogramme_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/themes.dart';

class ItemWidgetTrainings extends StatelessWidget {
  String? nomProgramme;
  String? id;
  ItemWidgetTrainings({Key? key,this.nomProgramme,this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Color> tabColors = [Colors.redAccent,Colors.blueAccent,Colors.greenAccent,Colors.purpleAccent,Colors.amberAccent,Colors.pinkAccent];
    int randomNumberColor = Random().nextInt(5);
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: tabColors[randomNumberColor].withAlpha(60),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 20,),
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  SizedBox(
                    width: 200,
                      child: Text(nomProgramme!,style: CustomThemes.widgetName,)),
                  const Expanded(child: SizedBox()),
                  const Image(image: AssetImage("assets/images/sport.png"), width: 80,height: 80,)

                ],
              ),
            ),
            const SizedBox(height: 30,),
            Container(
              margin: const EdgeInsets.only(right: 40,left: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 130,
                      height: 40,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.arrow_right, size: 40,),
                          Text("50 min",style: CustomThemes.howManyTimesTitle,),
                        ],
                      ),
                    ),
                    onTap: (){
                      context.read<StartProgrammeBloc>().add(InitBoxGetCheckedEvent());
                      Navigator.pushNamed(context, "startprogramme",arguments: {'idProgramme': id,'nom':nomProgramme});
                    },
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 60,
                      height: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Image(image: AssetImage("assets/images/stylo.png"),),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, "programmepage",arguments: {'id':id,'nom':nomProgramme});
                    },
                  ),
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
                                        db.collection("Programme").doc(id).delete();
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
