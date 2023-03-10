import 'package:appsport_project/ui/themes/themes.dart';
import 'package:appsport_project/ui/widgets/homepagewidget/headermenuelementwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/homepagewidget/itemwidgetprogrammesport.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
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
                BoutonMenuHomePage(assetImage: const AssetImage("assets/images/engrenages.png"),routeName: 'settings',),
                const SizedBox(width: 30),
                BoutonMenuHomePage(assetImage: const AssetImage("assets/images/analytique.png"), routeName: 'graph',),
                const SizedBox(width: 30),
                BoutonMenuHomePage(assetImage: const AssetImage("assets/images/programme.png"),routeName: 'exercice',),
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
            child: Text('Programme ', style: CustomThemes.secondTypeTitle,),
          ),
          Expanded(child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            children: [
              ItemWidgetTrainings(color: Colors.redAccent,),
              ItemWidgetTrainings(color: Colors.cyan,),
              ItemWidgetTrainings(color: Colors.purpleAccent,),
              ItemWidgetTrainings(color: Colors.purpleAccent,),
            ],
          ))
        ],
      ),

    );
  }
}
