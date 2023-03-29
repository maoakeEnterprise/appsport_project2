import 'package:flutter/material.dart';

class ModuloWidget extends StatelessWidget {
  const ModuloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double currentSliderValue = 0;

    return Slider(
        value: currentSliderValue,
        max: 10,
        divisions: 1,
        label: currentSliderValue.round().toString(),
        onChanged: (value){

        },
        );
  }
}
