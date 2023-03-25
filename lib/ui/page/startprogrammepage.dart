import 'package:appsport_project/ui/themes/themes.dart';
import 'package:appsport_project/ui/widgets/startprogrammewidget/widgetcheckbox.dart';
import 'package:appsport_project/ui/widgets/startprogrammewidget/widgettile.dart';
import 'package:appsport_project/ui/widgets/startprogrammewidget/widgetvalidatebutton.dart';
import 'package:flutter/material.dart';

class StartProgrammePage extends StatelessWidget {
  const StartProgrammePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['nom']),
      ),
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 10,right: 10,top: 20),
        child: Column(
          children: [
            WidgetCheckbox(idProgramme: arguments['idProgramme'],),
          ],
        ),
      ),
    );
  }
}
