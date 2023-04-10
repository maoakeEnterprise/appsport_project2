import 'package:appsport_project/bloc/graphprogrammebloc/graph_prgramme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TickWidget extends StatelessWidget {
  TickWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterChipWiget('jour'),
        FilterChipWiget('mois'),
        FilterChipWiget('annee'),
      ],
    );
  }

  Widget FilterChipWiget(nom) {
    return Expanded(
      child: BlocBuilder<GraphPrgrammeBloc, GraphPrgrammeState>(
        builder: (context, state) {
          return FilterChip(
              label: Text(nom!),
              selected: onSelect(state.nomTickWidget, nom),
              onSelected: (value) {
                context.read<GraphPrgrammeBloc>().add(GraphPageEvent(exercice: state.exercice,moduloValue: state.moduloValue,nomTickWidget: nom));
              });
        },
      ),
    );
  }
  bool onSelect(String? stateNom, String nom){
    if(stateNom == nom){
      return true;
    }
    return false;
  }
}
