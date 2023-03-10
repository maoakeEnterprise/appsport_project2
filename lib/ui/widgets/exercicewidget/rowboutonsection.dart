import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RowButtonSectionWidget extends StatelessWidget {
  String? text;
  int? cas;

  RowButtonSectionWidget({Key? key, this.text,this.cas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(5),
        width: 111,
        decoration: BoxDecoration(
            color: Colors.cyanAccent.withAlpha(40),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Text(text!,textAlign: TextAlign.center,),
      ),
      onTap: (){
        if(cas==0){
          context.read<ExerciceBloc>().add(HautDuCorpsEvent());
        }
        else if(cas == 1){
          context.read<ExerciceBloc>().add(BrasEvent());
        }
        else{
          context.read<ExerciceBloc>().add(BasDuCorpsEvent());
        }

      },
    );
  }
}
