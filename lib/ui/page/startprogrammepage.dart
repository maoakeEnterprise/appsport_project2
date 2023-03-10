import 'package:appsport_project/ui/themes/themes.dart';
import 'package:appsport_project/ui/widgets/startprogrammewidget/casewidgetstartprog.dart';
import 'package:flutter/material.dart';

class StartProgrammePage extends StatelessWidget {
  const StartProgrammePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nom Prog"),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context,index){
                  return const CaseWidgetStartProg();
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
