import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';

class TextFieldPoidsWidget extends StatelessWidget {
  const TextFieldPoidsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(30),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        autocorrect: true,
        cursorColor: Colors.black,
        cursorRadius: const Radius.circular(10),
        keyboardType: TextInputType.number,
        decoration: CustomThemes.textFieldStyle3,
        onChanged: (val) {
        },
      ),
    );
  }
}
