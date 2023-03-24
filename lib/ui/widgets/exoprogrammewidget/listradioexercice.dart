import 'package:appsport_project/bloc/createexoprogrammebloc/createexoprogramme_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListRadioExercice extends StatelessWidget {
  String? nomExercice;
  ListRadioExercice({Key? key,this.nomExercice}) : super(key: key);
  var db = FirebaseFirestore.instance;
  String currentOptions = "";

  @override
  Widget build(BuildContext context) {
    var dataExercice = db.collection('Exercices').snapshots();
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
              return BlocBuilder<CreateExoProgrammeBloc, CreateExoProgrammeState>(
                builder: (context, state) {
                  if(nomExercice != null){
                    context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(exerciceOption: nomExercice,poids: state.poids,repetitions: state.repetitions));
                    nomExercice = null;
                  }
                 if(state is  OptionState){
                   Map<String,String> map = {};
                   return ListView(
                     children:
                     snapshot.data!.docs.map((DocumentSnapshot document) {
                       Map<String, dynamic> data =
                       document.data()! as Map<String, dynamic>;
                       map.addAll({data['nom']:data['nomMuscle']});
                       return RadioListTile(
                           title: Text('${data['nom']}'),
                           value: data['nom'],
                           groupValue: state.exerciceOption,
                           onChanged: (val) {
                             if(state.poids != null && state.poids != "" && state.repetitions != null && state.repetitions != ""){
                             context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(exerciceOption: val,poids: state.poids,repetitions: state.repetitions,nomMuscle: map[val]));
                             }
                             else if(state.poids != null && state.poids != ""){
                               context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(exerciceOption: val,poids: state.poids,nomMuscle: map[val]));
                             }
                             else if(state.repetitions != null && state.repetitions != ""){
                               context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(exerciceOption: val,repetitions: state.repetitions,nomMuscle: map[val]));
                             }
                             else{
                               context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(exerciceOption: val,nomMuscle: map[val]));
                             }
                           });
                     }).toList(),
                   );
                 }
                  return ListView(
                    children:
                    snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                      document.data()! as Map<String, dynamic>;
                      return RadioListTile(
                          title: Text('${data['nom']}'),
                          value: data['nom'],
                          groupValue: currentOptions,
                          onChanged: (val) {
                            context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(exerciceOption: val));
                          });
                    }).toList(),
                  );
                },
              );
            }));
  }
}
