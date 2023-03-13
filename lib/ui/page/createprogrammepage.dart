import 'package:appsport_project/firebase/programmeexercicefirebase.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/programmewidget/textfilednomprogramme.dart';

class CreateProgrammePage extends StatelessWidget {
  CreateProgrammePage({Key? key}) : super(key: key);

  var db = FirebaseFirestore.instance;

  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Programme"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TextFieldNomProgramme(),
          //LIST DES EXO DANS LE PROGRAMME
          ProgrammeExerciceFirebase(id: arguments['id'],),
          //BOUTON VALIDER
          InkWell(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Valider", style: CustomThemes.widgetName,textAlign: TextAlign.center,),
            ),
            onTap: (){},
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 80),
        child: FloatingActionButton(
          onPressed: (){
            String routeName = "exoprogramme";
            Navigator.pushNamed(context, routeName,arguments: {'id':arguments['id']});
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
