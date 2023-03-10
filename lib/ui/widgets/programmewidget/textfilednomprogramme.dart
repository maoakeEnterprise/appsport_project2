import 'package:flutter/material.dart';

import '../../themes/themes.dart';

class TextFieldNomProgramme extends StatelessWidget {
  const TextFieldNomProgramme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(30),
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextField(
        decoration: CustomThemes.textFieldStyle2,
      ),
    );
  }
}
