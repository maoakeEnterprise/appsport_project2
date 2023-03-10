import 'package:appsport_project/ui/themes/themes.dart';
import 'package:appsport_project/ui/widgets/programmewidget/casewidgetexoprog.dart';
import 'package:flutter/material.dart';

import '../widgets/programmewidget/textfilednomprogramme.dart';

class CreateProgrammePage extends StatelessWidget {
  const CreateProgrammePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Programme"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const TextFieldNomProgramme(),
          Expanded(
            child: ListView.builder(
              itemCount: 4,
                itemBuilder: (context,index){
                return const CaseWidgetExoProg();
            }
            ),
          ),
          InkWell(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey.withAlpha(50),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text("Valider", style: CustomThemes.widgetName,textAlign: TextAlign.center,),
            ),
            onTap: (){},
          )
        ],
      ),
    );
  }
}
