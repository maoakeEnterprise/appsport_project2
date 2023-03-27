import 'package:appsport_project/bloc/startprogrammebloc/startprogramme_bloc.dart';
import 'package:appsport_project/ui/widgets/startprogrammewidget/widgettile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetCheckbox extends StatelessWidget {
  String? idProgramme;

  WidgetCheckbox({Key? key, this.idProgramme}) : super(key: key);
  int counterListLenght = 0;

  @override
  Widget build(BuildContext context) {
    var dbProgramme = FirebaseFirestore.instance
        .collection('Programme')
        .doc(idProgramme!)
        .collection('Exercices Programme')
        .snapshots();
    return Expanded(
      child: Column(
        children: [
          Expanded(
              child: StreamBuilder(
            stream: dbProgramme,
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text('ERROR');
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                  if (data['id'] == "0"){
                    return Container();
                  }
                  else{
                    return WidgetTile(
                      nomExercice: data['nomExercice'],
                      poids: data['poids'],
                      repetition: data['repetitions'],
                    );
                  }
                }).toList(),
              );
            },
          )),
        ],
      ),
    );
  }
}
