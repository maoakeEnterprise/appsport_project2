import 'package:appsport_project/bloc/createexercicebloc/createexercice_bloc.dart';
import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
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
        ],
    child: const RootView());
  }
}
