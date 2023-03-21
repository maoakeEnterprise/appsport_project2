import 'package:appsport_project/bloc/createexoprogrammebloc/createexoprogramme_bloc.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoutonValiderWidget extends StatelessWidget {
  const BoutonValiderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateExoProgrammeBloc, CreateExoProgrammeState>(
      builder: (context, state) {
        if(state is OptionState && state.poids != null && state.poids != "" && state.repetitions != null && state.repetitions != "" && state.exerciceOption != null){
          return InkWell(
            child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                    top: 5, bottom: 20, right: 20, left: 20),
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color: Colors.grey.withAlpha(50),
                    borderRadius: BorderRadius.circular(50)),
                child: Text(
                  "Valider",
                  style: CustomThemes.widgetName,
                  textAlign: TextAlign.center,
                )
            ),
            onTap: () {
              print("Option exercice: ${state.exerciceOption}");
              print("Poids: ${state.poids}");
              print("Répétitions: ${state.repetitions}");
              context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent());
              Navigator.pop(context);
            },
          );
        }
        return Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(
                top: 5, bottom: 20, right: 20, left: 20),
            width: MediaQuery
                .of(context)
                .size
                .width,
            decoration: BoxDecoration(
                color: Colors.red.withAlpha(50),
                borderRadius: BorderRadius.circular(50)),
            child: Text(
              "Valider",
              style: CustomThemes.widgetName,
              textAlign: TextAlign.center,
            )
        );
      },
    );
  }
}
