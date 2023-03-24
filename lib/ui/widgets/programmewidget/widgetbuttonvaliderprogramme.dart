import 'package:appsport_project/bloc/programmebloc/programme_bloc.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetButtonValiderProgramme extends StatelessWidget {
  String? idProgramme;
  WidgetButtonValiderProgramme({Key? key,this.idProgramme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    return BlocBuilder<ProgrammeBloc, ProgrammeState>(
      builder: (context, state) {
        if(state is ProgrammeValidateState && state.nomProgramme != null && state.nomProgramme != ""){
          return InkWell(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Valider", style: CustomThemes.widgetName,
                textAlign: TextAlign.center,),
            ),
            onTap: () {
              db.collection("Programme").doc(idProgramme).update({"nom" : state.nomProgramme});
              Navigator.pop(context);
            },
          );
        }
        return Container(
          width: double.infinity,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.red.withAlpha(50),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Text("Valider", style: CustomThemes.widgetName,
            textAlign: TextAlign.center,),
        );

      },
    );
  }
}
