part of 'createexoprogramme_bloc.dart';

@immutable
abstract class CreateExoProgrammeEvent {
  String? exerciceOption;
  String? poids;
  String? repetitions;
  String? nomMuscle;
  int? serie;
  CreateExoProgrammeEvent({this.exerciceOption,this.poids,this.repetitions,this.nomMuscle,this.serie});
}

class RadioListOptionEvent extends CreateExoProgrammeEvent{
  RadioListOptionEvent({exerciceOption,poids,repetitions,nomMuscle,serie}):super(exerciceOption: exerciceOption,poids: poids,repetitions: repetitions,nomMuscle: nomMuscle,serie: serie);
}

