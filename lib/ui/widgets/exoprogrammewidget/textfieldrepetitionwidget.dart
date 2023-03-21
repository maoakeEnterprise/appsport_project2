import 'package:appsport_project/bloc/createexoprogrammebloc/createexoprogramme_bloc.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldRepetitionWidget extends StatelessWidget {
  const TextFieldRepetitionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateExoProgrammeBloc, CreateExoProgrammeState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.grey.withAlpha(30),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            autocorrect: true,
            cursorColor: Colors.black,
            cursorRadius: const Radius.circular(10),
            keyboardType: TextInputType.number,
            decoration: CustomThemes.textFieldStyle4,
            onChanged: (val) {


              if(state.poids != null && state.poids != "" && state.exerciceOption != null){
                context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(repetitions: val,poids: state.poids, exerciceOption: state.exerciceOption));
              }
              else if(state.poids != null && state.poids != ""){
              context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(repetitions: val,poids: state.poids));
              }
              else if(state.exerciceOption != null){
                context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(repetitions: val, exerciceOption: state.exerciceOption));
              }
              else{
                context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(repetitions: val));
              }
            },
          ),
        );
      },
    );
  }
}
