import 'package:appsport_project/bloc/createexercicebloc/createexercice_bloc.dart';
import 'package:appsport_project/ui/widgets/createexercicewidget/gridviewexercice.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../themes/themes.dart';
import '../widgets/createexercicewidget/textfieldnameexercice.dart';

class CreateExercice extends StatelessWidget {
  const CreateExercice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nouveau Ex"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const TextFiledNameExercice(),
          GridViewExercice(),
          BlocBuilder<CreateExerciceBloc, CreateExerciceState>(
  builder: (context, state) {
    return InkWell(
              borderRadius: BorderRadius.circular(50),
            child: Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(top: 5, bottom: 20,right: 20,left: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.circular(50)
              ),
              child: Text("Valider",style: CustomThemes.widgetName,textAlign: TextAlign.center,)
            ),
            onTap: (){
                if(state.nameMuscle != null && state.nameExercice!= null){
                  print(state.nameExercice);
                  print(state.nameMuscle);
                }
            },
          );
  },
)
        ],
      ),
    );
  }
}
