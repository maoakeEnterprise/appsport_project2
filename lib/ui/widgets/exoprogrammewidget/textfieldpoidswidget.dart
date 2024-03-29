import 'package:appsport_project/bloc/createexoprogrammebloc/createexoprogramme_bloc.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFieldPoidsWidget extends StatelessWidget {
  String? poids;
  TextFieldPoidsWidget({Key? key,this.poids}) : super(key: key);
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.text = "";
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(30),
        borderRadius: BorderRadius.circular(15),
      ),
      child: BlocBuilder<CreateExoProgrammeBloc, CreateExoProgrammeState>(
        builder: (context, state) {
          if(poids!= null){
            controller.text = poids!;
            poids = null;
            return TextField(
              autocorrect: true,
              cursorColor: Colors.black,
              cursorRadius: const Radius.circular(10),
              keyboardType: TextInputType.number,
              decoration: CustomThemes.textFieldStyle3,
              controller: controller,
              onChanged: (val) {
                if(state.repetitions != null && state.repetitions != "" && state.exerciceOption != null){
                  context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(poids: val, repetitions: state.repetitions, exerciceOption: state.exerciceOption,nomMuscle: state.nomMuscle,serie: state.serie));
                }
                else if(state.repetitions != null && state.repetitions != ""){
                  context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(poids: val, repetitions: state.repetitions,serie: state.serie));
                }
                else if(state.exerciceOption != null){
                  context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(poids: val, exerciceOption: state.exerciceOption,nomMuscle: state.nomMuscle,serie: state.serie));
                }
                else{
                  context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(poids: val,serie: state.serie));
                }

              },
            );
          }
          return TextField(
            autocorrect: true,
            cursorColor: Colors.black,
            cursorRadius: const Radius.circular(10),
            keyboardType: TextInputType.number,
            decoration: CustomThemes.textFieldStyle3,
            onChanged: (val) {
              if(state.repetitions != null && state.repetitions != "" && state.exerciceOption != null){
              context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(poids: val, repetitions: state.repetitions, exerciceOption: state.exerciceOption,nomMuscle: state.nomMuscle,serie: state.serie));
              }
              else if(state.repetitions != null && state.repetitions != ""){
                context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(poids: val, repetitions: state.repetitions,serie: state.serie));
              }
              else if(state.exerciceOption != null){
                context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(poids: val, exerciceOption: state.exerciceOption,nomMuscle: state.nomMuscle,serie: state.serie));
              }
              else{
                context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(poids: val,serie: state.serie));
              }

            },
          );
        },
      ),
    );

  }
}
