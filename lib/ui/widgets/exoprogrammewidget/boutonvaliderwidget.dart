import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';

class BoutonValiderWidget extends StatelessWidget {
  const BoutonValiderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(
              top: 5, bottom: 20, right: 20, left: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.grey.withAlpha(50),
              borderRadius: BorderRadius.circular(50)),
          child: Text(
            "Valider",
            style: CustomThemes.widgetName,
            textAlign: TextAlign.center,
          )
      ),
      onTap: (){
      },
    );
  }
}
