import 'dart:math';

import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';

class CaseWidgetExercice extends StatelessWidget {
  String? nom;
  String? nomMuscle;

  CaseWidgetExercice({Key? key,this.nom,this.nomMuscle}) : super(key: key);

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

                  },
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