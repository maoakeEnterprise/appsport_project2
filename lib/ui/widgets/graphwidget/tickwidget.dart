import 'package:flutter/material.dart';

class TickWidget extends StatelessWidget {
  TickWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        FilterChipWiget('jour'),
        FilterChipWiget('mois'),
        FilterChipWiget('annee'),
      ],
    );
  }

  Widget FilterChipWiget(nom){
    var onSelected = false;
    return FilterChip(
        label: Text(nom!),
        selected: onSelected,
        onSelected: (value){

        });
  }
}
