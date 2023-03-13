import 'package:appsport_project/ui/widgets/exoprogrammewidget/boutonvaliderwidget.dart';
import 'package:appsport_project/ui/widgets/exoprogrammewidget/listradioexercice.dart';
import 'package:appsport_project/ui/widgets/exoprogrammewidget/textfieldpoidswidget.dart';
import 'package:appsport_project/ui/widgets/exoprogrammewidget/textfieldrepetitionwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExoProgramme extends StatelessWidget {
  ExoProgramme({Key? key}) : super(key: key);
  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
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
          BoutonValiderWidget()
        ],
      ),
    );
  }
}
