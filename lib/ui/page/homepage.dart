import 'package:appsport_project/model/programmes.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:appsport_project/ui/widgets/homepagewidget/headermenuelementwidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/homepagewidget/itemwidgetprogrammesport.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;
  var db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var informationProgramme = db.collection("Programme").snapshots();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Bienvenue"),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 70,
            child: ListView(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              children: [
                BoutonMenuHomePage(
                  assetImage: const AssetImage("assets/images/engrenages.png"),
                  routeName: 'settings',
                ),
                const SizedBox(width: 30),
                BoutonMenuHomePage(
                  assetImage: const AssetImage("assets/images/analytique.png"),
                  routeName: 'graph',
                ),
                const SizedBox(width: 30),
                BoutonMenuHomePage(
                  assetImage: const AssetImage("assets/images/programme.png"),
                  routeName: 'exercice',
                ),
                const SizedBox(width: 30),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: double.infinity,
            height: 50,
            padding: const EdgeInsets.all(10),
            child: Text(
              'Programme ',
              style: CustomThemes.secondTypeTitle,
            ),
          ),
          Expanded(
            child: StreamBuilder(
                stream: informationProgramme,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text("Error");
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      if (user.uid == data['idUser']) {
                        return ItemWidgetTrainings(
                          id: data['id'],
                          nomProgramme: data['nom'],
                        );
                      }
                      return Container();
                    }).toList(),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "btn2",
              onPressed: () {
                Navigator.pushNamed(context, "nutritionProgramme");
              },
              child: const Icon(Icons.accessibility),
            ),
            Expanded(child: Container()),
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                final prog = Programme(
                  id: "",
                  idUser: user.uid,
                  nom: "Programme ?",
                );
                db
                    .collection("Programme")
                    .withConverter(
                    fromFirestore: Programme.fromFirestore,
                    toFirestore: (Programme prog, options) => prog.toFirestore())
                    .add(prog)
                    .then((value){
                  db.collection('Programme').doc(value.id).update({"id": value.id});
                  db.collection('Programme').doc(value.id).collection('Exercices Programme').doc("0").set({'id':'0'});
                  String route = 'programmepage';
                  Navigator.pushNamed(context, route,arguments: {'id':value.id});
                });

              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
