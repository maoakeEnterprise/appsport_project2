import 'package:appsport_project/bloc/createexercicebloc/createexercice_bloc.dart';
import 'package:appsport_project/model/exercice.dart';
import 'package:appsport_project/ui/widgets/createexercicewidget/gridviewexercice.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes/themes.dart';
import '../widgets/createexercicewidget/textfieldnameexercice.dart';

class CreateExercice extends StatelessWidget {
  CreateExercice({
    Key? key,
  }) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;
  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    if (arguments['nomMuscle'] != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Modifier Ex"),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFiledNameExercice(
              nom: arguments['nom'],
              nameMuscle: arguments['nomMuscle'],
              idMuscle: arguments['idMuscle'],
              type: arguments['type'],
            ),
            GridViewExercice(),
            BlocBuilder<CreateExerciceBloc, CreateExerciceState>(
              builder: (context, state) {
                if (state.nameMuscle != null &&
                    state.nameExercice != null &&
                    state.nameExercice != "") {
                  return InkWell(
                    child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(
                            top: 5, bottom: 20, right: 20, left: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.grey.withAlpha(50),
                            borderRadius: BorderRadius.circular(50)),
                        child: Text(
                          "Valider",
                          style: CustomThemes.widgetName,
                          textAlign: TextAlign.center,
                        )),
                    onTap: () {
                      var db =
                          FirebaseFirestore.instance.collection("Exercices");
                      db.doc(arguments['id']).update({
                        'idmuscle': state.idMuscle,
                        'nomMuscle': state.nameMuscle,
                        'type': state.type,
                        'nom': state.nameExercice
                      });
                      Navigator.pop(context);
                    },
                  );
                }
                return Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.only(
                        top: 5, bottom: 20, right: 20, left: 20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.red.withAlpha(50),
                        borderRadius: BorderRadius.circular(50)),
                    child: Text(
                      "Valider",
                      style: CustomThemes.widgetName,
                      textAlign: TextAlign.center,
                    ));
              },
            ),
          ],
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau Ex"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFiledNameExercice(),
          GridViewExercice(),
          BlocBuilder<CreateExerciceBloc, CreateExerciceState>(
            builder: (context, state) {
              if (state.nameMuscle != null &&
                  state.nameExercice != null &&
                  state.nameExercice != "") {
                return InkWell(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(
                          top: 5, bottom: 20, right: 20, left: 20),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.withAlpha(50),
                          borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        "Valider",
                        style: CustomThemes.widgetName,
                        textAlign: TextAlign.center,
                      )),
                  onTap: () {
                    final exo = Exercice(
                        id: "",
                        idUser: user.uid,
                        idmuscle: state.idMuscle,
                        nomMuscle: state.nameMuscle,
                        nom: state.nameExercice,
                        type: state.type);
                    var db = FirebaseFirestore.instance;
                    db
                        .collection("Exercices")
                        .withConverter(
                            fromFirestore: Exercice.fromFirestore,
                            toFirestore: (Exercice ex, options) =>
                                ex.toFirestore())
                        .add(exo)
                        .then((value) => db
                            .collection("Exercices")
                            .doc(value.id)
                            .update({"id": value.id}));
                    context.read<CreateExerciceBloc>().add(CloseEvent());
                    FocusScope.of(context).unfocus();
                    Navigator.pop(context);
                  },
                );
              }
              return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.only(
                      top: 5, bottom: 20, right: 20, left: 20),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.red.withAlpha(50),
                      borderRadius: BorderRadius.circular(50)),
                  child: Text(
                    "Valider",
                    style: CustomThemes.widgetName,
                    textAlign: TextAlign.center,
                  ));
            },
          )
        ],
      ),
    );
  }
}
