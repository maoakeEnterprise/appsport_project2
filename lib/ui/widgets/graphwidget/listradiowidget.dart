import 'package:appsport_project/bloc/graphprogrammebloc/graph_prgramme_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListRadioWidget extends StatelessWidget {
  ListRadioWidget({Key? key}) : super(key: key);

  var db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    var dataExercice = db.collection('Exercices').snapshots();
    context.read<GraphPrgrammeBloc>().add(GraphPageEvent(exercice: 'Curl Biceps',nomTickWidget: 'jour'));
    return Expanded(
      child: StreamBuilder(
          stream: dataExercice,
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('ERROR');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return BlocBuilder<GraphPrgrammeBloc, GraphPrgrammeState>(
              builder: (context, state) {
                return ListView(
                  children:
                  snapshot.data!.docs.map((DocumentSnapshot document) {
                    Map<String, dynamic> data =
                    document.data()! as Map<String, dynamic>;
                    if (data['idUser'] == user.uid) {
                      return RadioListTile(
                          title: Text('${data['nom']}'),
                          value: data['nom'],
                          groupValue: GetClickMuscle(state.exercice),
                          onChanged: (val) {
                            context.read<GraphPrgrammeBloc>().add(GraphPageEvent(exercice: val,moduloValue: state.moduloValue,nomTickWidget: state.nomTickWidget));
                          });
                    }
                    return Container();
                  }).toList(),
                );
              },
            );
          }),
    );
  }

  String GetClickMuscle(String? muscle){
    String result;
    result = muscle ?? 'Curl Biceps';
    return result;
  }
}
