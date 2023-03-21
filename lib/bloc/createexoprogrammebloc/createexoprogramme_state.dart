part of 'createexoprogramme_bloc.dart';

@immutable
abstract class CreateExoProgrammeState {
  String? exerciceOption;
  String? poids;
  String? repetitions;
  CreateExoProgrammeState({this.exerciceOption,this.poids,this.repetitions});
}

class CreateExoProgrammeInitial extends CreateExoProgrammeState {}
class OptionState extends CreateExoProgrammeState{
  OptionState({exerciceOption,poids,repetitions}):super(exerciceOption: exerciceOption,poids: poids,repetitions: repetitions);
}

