import 'package:appsport_project/bloc/createexercicebloc/createexercice_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetExercice extends StatelessWidget {
  AssetImage? image;
  int? idMuscle;
  int? getChoose;
  WidgetExercice({Key? key,this.image,this.getChoose,this.idMuscle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(getChoose == 0){
      return InkWell(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.red,width: 5)
          ),
          child: Image(image: image!,),

        ),
        onTap: (){
        },
      );
    }
    return BlocBuilder<CreateExerciceBloc, CreateExerciceState>(
  builder: (context, state) {
    return InkWell(
        borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
        ),
        child: Image(image: image!,),

      ),
      onTap: (){
          if(idMuscle == 0){

            if(state.nameExercice != null){

              context.read<CreateExerciceBloc>().add(BicepsEvent(titleExercice: state.nameExercice));
            }
            else{
              context.read<CreateExerciceBloc>().add(BicepsEvent());
            }
          }
          if(idMuscle == 1){
            if(state.nameExercice != null){
              context.read<CreateExerciceBloc>().add(AbdosEvent(titleExercice: state.nameExercice));
            }
            else{
              context.read<CreateExerciceBloc>().add(AbdosEvent());
            }
          }
          if(idMuscle == 2){
            if(state.nameExercice != null){
              context.read<CreateExerciceBloc>().add(JambeEvent(titleExercice: state.nameExercice));
            }
            else{
              context.read<CreateExerciceBloc>().add(JambeEvent());
            }
          }
          if(idMuscle == 3){
            if(state.nameExercice != null){
              context.read<CreateExerciceBloc>().add(EpauleEvent(titleExercice: state.nameExercice));
            }
            else{
              context.read<CreateExerciceBloc>().add(EpauleEvent());
            }
          }
          if(idMuscle == 4){
            if(state.nameExercice != null){
              context.read<CreateExerciceBloc>().add(DosEvent(titleExercice: state.nameExercice));
            }
            else{
              context.read<CreateExerciceBloc>().add(DosEvent());
            }
          }
          if(idMuscle == 5){
            if(state.nameExercice != null){
              context.read<CreateExerciceBloc>().add(TricepsEvent(titleExercice: state.nameExercice));
            }
            else{
              context.read<CreateExerciceBloc>().add(TricepsEvent());
            }
          }
          if(idMuscle == 6){
            if(state.nameExercice != null){
              context.read<CreateExerciceBloc>().add(PectoreauxEvent(titleExercice: state.nameExercice));
            }
            else{
              context.read<CreateExerciceBloc>().add(PectoreauxEvent());
            }
          }
      },
    );
  },
);
  }
}
