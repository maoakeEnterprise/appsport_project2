import 'package:appsport_project/bloc/createexoprogrammebloc/createexoprogramme_bloc.dart';
import 'package:appsport_project/firebase/programmeexercicefirebase.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:appsport_project/ui/widgets/programmewidget/widgetbuttonvaliderprogramme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/programmewidget/textfilednomprogramme.dart';

class CreateProgrammePage extends StatelessWidget {
  CreateProgrammePage({Key? key}) : super(key: key);

  var db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;
  var nomProgramme;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;

    nomProgramme = arguments['nom'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Programme"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TextFieldNomProgramme(nom: nomProgramme,),
          //LIST DES EXO DANS LE PROGRAMME
          ProgrammeExerciceFirebase(id: arguments['id'],),
          //BOUTON VALIDER
          WidgetButtonValiderProgramme(idProgramme: arguments['id'],),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: (){
            context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent());
            String routeName = "exoprogramme";
            Navigator.pushNamed(context, routeName,arguments: {'idProgramme':arguments['id'],'cas' : 'ADD'});
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
