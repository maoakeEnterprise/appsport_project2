import 'dart:ffi';

import 'package:appsport_project/bloc/createexoprogrammebloc/createexoprogramme_bloc.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DropDownNumberSeries extends StatelessWidget {
  const DropDownNumberSeries({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<int> item = <int>[1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    int dropDownValue = item.first;

    return Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        children: [
          Text('Série : ', style: CustomThemes.secondTypeTitle,),
          const SizedBox(width: 30,),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(15)
            ),
            padding: const EdgeInsets.all(3),
            child: BlocBuilder<CreateExoProgrammeBloc, CreateExoProgrammeState>(
              builder: (context, state) {
                return DropdownButton(
                  dropdownColor: Colors.white,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 36,
                  underline: const SizedBox(),
                  items: item.map((valueItem) {
                    return DropdownMenuItem(
                        value: valueItem,
                        child: Text('$valueItem'));
                  }).toList(),
                  onChanged: (val) {
                    dropDownValue = val!;
                    if(state.repetitions != null && state.repetitions != "" && state.exerciceOption != null){
                      context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(serie: val,poids: state.poids, repetitions: state.repetitions, exerciceOption: state.exerciceOption,nomMuscle: state.nomMuscle));
                    }
                    else if(state.repetitions != null && state.repetitions != ""){
                      context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(serie: val,poids: state.poids, repetitions: state.repetitions));
                    }
                    else if(state.poids != null && state.poids != ""){
                      context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(serie: val,poids: state.poids, repetitions: state.repetitions));
                    }
                    else if(state.exerciceOption != null){
                      context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(serie: val,poids: state.poids, exerciceOption: state.exerciceOption,nomMuscle: state.nomMuscle));
                    }
                    else{
                      context.read<CreateExoProgrammeBloc>().add(RadioListOptionEvent(serie: val));
                    }

                  },
                  value: dropDownValue,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
