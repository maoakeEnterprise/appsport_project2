part of 'createexoprogramme_bloc.dart';

@immutable
abstract class CreateExoProgrammeState {
  String? exerciceOption;
  String? poids;
  String? repetitions;
  String? nomMuscle;
  int? serie;
  CreateExoProgrammeState({this.exerciceOption,this.poids,this.repetitions,this.nomMuscle,this.serie});
}

class CreateExoProgrammeInitial extends CreateExoProgrammeState {}
class OptionState extends CreateExoProgrammeState{
  OptionState({exerciceOption,poids,repetitions,nomMuscle,serie}):super(exerciceOption: exerciceOption,poids: poids,repetitions: repetitions,nomMuscle: nomMuscle,serie: serie);
}

