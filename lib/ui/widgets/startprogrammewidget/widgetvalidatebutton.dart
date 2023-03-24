import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';

class WidgetValidateButton extends StatelessWidget {
  const WidgetValidateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
    );
  }
}
