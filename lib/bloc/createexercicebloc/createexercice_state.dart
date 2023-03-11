part of 'createexercice_bloc.dart';

@immutable
abstract class CreateExerciceState {
  String? nameMuscle;
  String? errorMessage;
  String? nameExercice;
  String? idMuscle;
  String? type;
  CreateExerciceState({this.nameMuscle,this.errorMessage,this.nameExercice,this.idMuscle,this.type});
}

class CreateExerciceInitial extends CreateExerciceState {
  CreateExerciceInitial({nameMuscle}):super(nameMuscle: nameMuscle);
}
class SelectedMuscleState extends CreateExerciceState{
  SelectedMuscleState({nameMuscle,nameExercice,idMuscle,type}):super(nameMuscle: nameMuscle,nameExercice: nameExercice,idMuscle: idMuscle,type: type);
}
class ErrorMuscleState extends CreateExerciceState{
  ErrorMuscleState({nameMuscle,errorMessage}):super(nameMuscle: nameMuscle, errorMessage: errorMessage);
}
class ValidateExerciceState extends CreateExerciceState{
  ValidateExerciceState({nameMuscle,nameExercice,idMuscle,type}):super(nameMuscle: nameMuscle,nameExercice: nameExercice,idMuscle: idMuscle,type: type);
}
