part of 'createexoprogramme_bloc.dart';

@immutable
abstract class CreateExoProgrammeEvent {
  String? exerciceOption;
  String? poids;
  String? repetitions;
  String? nomMuscle;
  CreateExoProgrammeEvent({this.exerciceOption,this.poids,this.repetitions,this.nomMuscle});
}

class RadioListOptionEvent extends CreateExoProgrammeEvent{
  RadioListOptionEvent({exerciceOption,poids,repetitions,nomMuscle}):super(exerciceOption: exerciceOption,poids: poids,repetitions: repetitions,nomMuscle: nomMuscle);
}

