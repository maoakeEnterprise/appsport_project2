import 'package:appsport_project/bloc/graphprogrammebloc/graph_prgramme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModuloWidget extends StatelessWidget {
  const ModuloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<GraphPrgrammeBloc, GraphPrgrammeState>(
      builder: (context, state) {
        return Slider(
          value: state.moduloValue ?? 1,
          min: 1,
          max: 10,
          divisions: 10,
          label: getLabel(state.moduloValue),
          onChanged: (value) {
            context.read<GraphPrgrammeBloc>().add(GraphPageEvent(exercice: state.exercice,moduloValue: value,nomTickWidget: state.nomTickWidget));
          },
        );
      },
    );
  }
  String getLabel(double? label){
    if(label != null){
      return label.round().toString();
    }
    return '1';
  }
}
