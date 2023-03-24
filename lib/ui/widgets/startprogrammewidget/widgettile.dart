import 'package:flutter/material.dart';

class WidgetTile extends StatelessWidget {
  String? nomExercice;
  String? poids;
  String? repetition;
  WidgetTile({Key? key,this.nomExercice,this.poids,this.repetition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.red,
      ),
      child: Row(
        children: [
          Checkbox(
              checkColor: Colors.white,
              value: false,
              onChanged: (value){

          })
        ],
      ),
    );
  }
}
