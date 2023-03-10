part of 'createexercice_bloc.dart';

@immutable
abstract class CreateExerciceState {
  String? nameMuscle;
  String? errorMessage;
  String? nameExercice;
  CreateExerciceState({this.nameMuscle,this.errorMessage,this.nameExercice});
}

class CreateExerciceInitial extends CreateExerciceState {
  CreateExerciceInitial({nameMuscle}):super(nameMuscle: nameMuscle);
}
class SelectedMuscleState extends CreateExerciceState{
  SelectedMuscleState({nameMuscle,nameExercice}):super(nameMuscle: nameMuscle,nameExercice: nameExercice);
}
class ErrorMuscleState extends CreateExerciceState{
  ErrorMuscleState({nameMuscle,errorMessage}):super(nameMuscle: nameMuscle, errorMessage: errorMessage);
}
class ValidateExerciceState extends CreateExerciceState{
  ValidateExerciceState({nameMuscle,nameExercice}):super(nameMuscle: nameMuscle,nameExercice: nameExercice);
}
