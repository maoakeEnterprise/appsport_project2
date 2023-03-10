// ignore: file_names
import 'package:appsport_project/bloc/exercicebloc/exercice_bloc.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchSectionWidget extends StatelessWidget {
  SearchSectionWidget({Key? key}) : super(key: key);
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5,left: 20,right: 20),
      //padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey.withAlpha(30),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(child: TextField(
            autocorrect: true,
            cursorColor: Colors.black,
            cursorRadius: const Radius.circular(10),
            decoration: CustomThemes.textFieldStyle,
            onChanged: (val){name=val;},
          )
          ),
          InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: (){
              context.read<ExerciceBloc>().add(SearchExoEvent(name));
            },
            child: Container(
              padding: const EdgeInsets.all(20),
              child: const Image(
                width:20,
                height:20,
                image: AssetImage("assets/images/loupe.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
