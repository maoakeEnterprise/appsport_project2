part of 'createexoprogramme_bloc.dart';

@immutable
abstract class CreateExoProgrammeEvent {
  String? exerciceOption;
  String? poids;
  String? repetitions;
  CreateExoProgrammeEvent({this.exerciceOption,this.poids,this.repetitions});
}

class RadioListOptionEvent extends CreateExoProgrammeEvent{
  RadioListOptionEvent({exerciceOption,poids,repetitions}):super(exerciceOption: exerciceOption,poids: poids,repetitions: repetitions);
}

