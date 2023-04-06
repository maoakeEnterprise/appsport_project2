import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ListRadioWidget extends StatelessWidget {
  ListRadioWidget({Key? key}) : super(key: key);

  var db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

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
            return ListView(
              children:
              snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
                if(data['idUser'] == user.uid){
                  return RadioListTile(
                      title: Text('${data['nom']}'),
                      value: data['nom'],
                      groupValue: false,
                      onChanged: (val) {

                      });
                }
                return Container();
              }).toList(),
            );
          }),
    );
  }
}
