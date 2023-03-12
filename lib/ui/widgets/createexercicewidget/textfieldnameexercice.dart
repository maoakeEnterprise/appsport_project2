import 'package:appsport_project/bloc/createexercicebloc/createexercice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/themes.dart';

class TextFiledNameExercice extends StatelessWidget {
  String? nom;
  String? nameMuscle;
  String? idMuscle;
  String? type;
  TextFiledNameExercice({Key? key,this.nom,this.nameMuscle,this.idMuscle,this.type}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.withAlpha(40),
          borderRadius: BorderRadius.circular(15)
      ),
      child: BlocBuilder<CreateExerciceBloc, CreateExerciceState>(
        builder: (context, state) {
          if(nom != null){
            TextEditingController controller = TextEditingController();
            controller.text = nom!;
            if(state.nameMuscle == null){
              context.read<CreateExerciceBloc>().add(
                  TitleExerciceChangeEvent(titleExercice: nom,nameMuscle: nameMuscle,idMuscle: idMuscle,type: type));
            }
            return TextField(
              decoration: CustomThemes.textFieldStyle,
              controller: controller,
              onChanged: (val) {
                nom = null;
                context.read<CreateExerciceBloc>().add(
                    TitleExerciceChangeEvent(titleExercice: val,nameMuscle: state.nameMuscle,idMuscle: state.idMuscle,type: state.type));
                },
            );
          }
          if(state.nameMuscle != null){
            return TextField(
              decoration: CustomThemes.textFieldStyle,
              onChanged: (val) {
                context.read<CreateExerciceBloc>().add(
                    TitleExerciceChangeEvent(titleExercice: val,nameMuscle: state.nameMuscle,idMuscle: state.idMuscle,type: state.type));
              },
            );
          }
          return TextField(
            decoration: CustomThemes.textFieldStyle,
            onChanged: (val) {
              context.read<CreateExerciceBloc>().add(TitleExerciceChangeEvent(titleExercice: val));
            },
          );
        },
      ),
    );
  }
}
