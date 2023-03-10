import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
import 'package:appsport_project/ui/widgets/exercicewidget/casewidgetexercice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class ExerciceFirebase extends StatelessWidget {
  ExerciceFirebase({Key? key}) : super(key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;
  Stream<QuerySnapshot> informationExercice = FirebaseFirestore.instance.collection('Exercices').snapshots();
  bool flag = false;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ExerciceBloc, ExerciceState>(
        builder: (context, state) {
          if (state is ExerciceSuccessState) {
            informationExercice = FirebaseFirestore.instance.collection('Exercices').where('type',isEqualTo: state.type).snapshots();
            return StreamBuilder(
                stream: informationExercice,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("ERROR");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  return ListView(
                    children:
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                      print(state.valSearching);
                      if(data['idUser'] == user.uid){
                        if(state.type != null){
                          return CaseWidgetExercice(nom: data['nom'],nomMuscle: data['nomMuscle'],);
                        }
                        else if(state.valSearching != null && data['nom'].toString().toLowerCase().startsWith(state.valSearching!.toLowerCase())){
                          return CaseWidgetExercice(nom: data['nom'],nomMuscle: data['nomMuscle'],);
                        }
                      }
                      return Container();

                    }).toList(),
                  );
                });
          }
          else{
            return StreamBuilder(
                stream: informationExercice,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("ERROR");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  return ListView(
                    children:
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                      if(data['idUser'] == user.uid){
                        return CaseWidgetExercice(nom: data['nom'],nomMuscle: data['nomMuscle'],);
                      }
                      return Container();
                    }).toList(),
                  );
                });
          }
        },
      ),
    );
  }
}
