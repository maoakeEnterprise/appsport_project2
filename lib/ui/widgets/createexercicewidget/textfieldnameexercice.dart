import 'package:appsport_project/bloc/createexercicebloc/createexercice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/themes.dart';

class TextFiledNameExercice extends StatelessWidget {
  const TextFiledNameExercice({Key? key}) : super(key: key);

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
          if(state.nameMuscle != null){
            return TextField(
              decoration: CustomThemes.textFieldStyle,
              onChanged: (val) {
                context.read<CreateExerciceBloc>().add(
                    TitleExerciceChangeEvent(titleExercice: val,nameMuscle: state.nameMuscle));
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
