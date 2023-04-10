import 'package:appsport_project/bloc/createexercicebloc/createexercice_bloc.dart';
import 'package:appsport_project/bloc/createexoprogrammebloc/createexoprogramme_bloc.dart';
import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
import 'package:appsport_project/bloc/graphprogrammebloc/graph_prgramme_bloc.dart';
import 'package:appsport_project/bloc/programmebloc/programme_bloc.dart';
import 'package:appsport_project/bloc/startprogrammebloc/startprogramme_bloc.dart';
import 'package:appsport_project/ui/page/rootview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context)=>ExerciceBloc()),
          BlocProvider(create: (context)=>CreateExerciceBloc()),
          BlocProvider(create: (context)=>CreateExoProgrammeBloc()),
          BlocProvider(create: (context)=>ProgrammeBloc()),
          BlocProvider(create: (context)=>StartProgrammeBloc()),
          BlocProvider(create: (context)=>GraphPrgrammeBloc())
        ],
    child: const RootView());
  }
}
