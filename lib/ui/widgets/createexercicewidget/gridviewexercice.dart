import 'package:appsport_project/bloc/createexercicebloc/createexercice_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgetexercice.dart';

class GridViewExercice extends StatelessWidget {
  GridViewExercice({Key? key}) : super(key: key);
  FirebaseFirestore db = FirebaseFirestore.instance;
  Stream<QuerySnapshot> informationMuscle =
      FirebaseFirestore.instance.collection('Muscles').snapshots();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.redAccent.withAlpha(50),
            borderRadius: BorderRadius.circular(15)),
        child: BlocBuilder<CreateExerciceBloc, CreateExerciceState>(
          builder: (context, state) {
            return StreamBuilder(
                stream: informationMuscle,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return Container();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  return GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 15,
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      if(state.nameMuscle == data['nom']){
                        return WidgetExercice(
                          image: AssetImage("assets/images/${data['nom']}.png"),
                          idMuscle: int.parse(data['id']),
                          getChoose: 0,
                        );
                      }
                      return WidgetExercice(
                        image: AssetImage("assets/images/${data['nom']}.png"),
                        idMuscle: int.parse(data['id']),
                      );
                    }).toList(),
                  );
                });
          },
        ),
      ),
    );
  }
}
