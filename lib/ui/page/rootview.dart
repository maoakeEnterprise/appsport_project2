import 'package:appsport_project/provider/google_sign_in.dart';
import 'package:appsport_project/ui/page/authentificationpage.dart';
import 'package:appsport_project/ui/page/exercicespage.dart';
import 'package:appsport_project/ui/page/graphpage.dart';
import 'package:appsport_project/ui/page/homepage.dart';
import 'package:appsport_project/ui/page/settingspage.dart';
import 'package:appsport_project/ui/page/startprogrammepage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../themes/themes.dart';
import 'createexercice.dart';
import 'createprogrammepage.dart';
import 'exoprogramme.dart';

class RootView extends StatelessWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => GoogleSignInProvider(),
      child: MaterialApp(
        title: 'AppSport',
        theme: CustomThemes.themeData,
        routes: {
          "/" :  (context)=>const AuthentificationPage(),
          "home" :  (context)=> HomePage(),
          "settings": (context)=>const SettingsPage(),
          "graph": (context)=> const GraphPage(),
          "exercice": (context)=> ExercicesPage(),
          "nouveauexercice": (context)=> const CreateExercice(),
          "programmepage": (context)=> const CreateProgrammePage(),
          "exoprogramme": (context)=> const ExoProgramme(),
          "startprogramme": (context)=> const StartProgrammePage(),
        },
      ),
    );
  }
}
