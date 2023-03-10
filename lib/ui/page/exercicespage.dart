import 'package:appsport_project/firebase/exercicefirebase.dart';
import 'package:flutter/material.dart';
import '../widgets/exercicewidget/rowboutonsection.dart';
import '../widgets/exercicewidget/searchsection.dart';

class ExercicesPage extends StatelessWidget {
  ExercicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Exercices"),
          actions: [
            IconButton(onPressed: () {

            },
                icon: Image.asset("assets/images/engrenages.png",))
          ],
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            SearchSectionWidget(),
            Container(
              margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
              //color: Colors.redAccent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowButtonSectionWidget(text: "Haut du corps",cas: 0,),
                  RowButtonSectionWidget(text: "Bras",cas: 1,),
                  RowButtonSectionWidget(text: "Bas du Corps",cas: 2,),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            ExerciceFirebase(),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String routeNameNewExercice = 'nouveauexercice';
          Navigator.pushNamed(context, routeNameNewExercice);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
