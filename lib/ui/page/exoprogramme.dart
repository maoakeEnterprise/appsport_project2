import 'package:appsport_project/ui/widgets/exoprogrammewidget/boutonvaliderwidget.dart';
import 'package:appsport_project/ui/widgets/exoprogrammewidget/listradioexercice.dart';
import 'package:appsport_project/ui/widgets/exoprogrammewidget/textfieldpoidswidget.dart';
import 'package:appsport_project/ui/widgets/exoprogrammewidget/textfieldrepetitionwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExoProgramme extends StatelessWidget {
  ExoProgramme({Key? key}) : super(key: key);
  var db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    if(arguments['poids'] != null && arguments['repetitions'] != null){
      return Scaffold(
        appBar: AppBar(
          title: const Text("Exo Prog"),
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            TextFieldPoidsWidget(poids: arguments['poids'],),
            TextFieldRepetitionWidget(repetitions: arguments['repetitions'],),
            ListRadioExercice(nomExercice: arguments['nomExercice'],idUser: user.uid,),
            BoutonValiderWidget(cas: arguments['cas'],idProgramme: arguments['idProgramme'],idExerciceProgramme: arguments['id'])
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Exo Prog"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          TextFieldPoidsWidget(),
          TextFieldRepetitionWidget(),
          ListRadioExercice(),
          BoutonValiderWidget(cas: arguments['cas'],idProgramme: arguments['idProgramme'],idExerciceProgramme: arguments['id'],)
        ],
      ),
    );
  }
}
