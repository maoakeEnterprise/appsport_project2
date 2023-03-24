import 'package:appsport_project/bloc/programmebloc/programme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../themes/themes.dart';

class TextFieldNomProgramme extends StatelessWidget {
  String? nom;

  TextFieldNomProgramme({Key? key, this.nom}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.grey.withAlpha(30),
          borderRadius: BorderRadius.circular(15)
      ),
      child: BlocBuilder<ProgrammeBloc, ProgrammeState>(
        builder: (context, state) {
          if (nom != null) {
            TextEditingController controller = TextEditingController();
            controller.text = nom!;
            context.read<ProgrammeBloc>().add(NomProgrammeEvent(nom: nom));
            nom = null;
            return TextField(
              decoration: CustomThemes.textFieldStyle2,
              controller: controller,
              onChanged: (val){
                context.read<ProgrammeBloc>().add(NomProgrammeEvent(nom: val));
              },
            );

          }
          return TextField(
            decoration: CustomThemes.textFieldStyle2,
            onChanged: (val){
              context.read<ProgrammeBloc>().add(NomProgrammeEvent(nom: val));
            },
          );
        },
      ),
    );
  }
}
