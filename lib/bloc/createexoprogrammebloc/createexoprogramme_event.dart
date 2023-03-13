part of 'createexoprogramme_bloc.dart';

@immutable
abstract class CreateExoProgrammeEvent {
  String? exerciceOption;
  CreateExoProgrammeEvent({this.exerciceOption});
}

class RadioListOptionEvent extends CreateExoProgrammeEvent{
  RadioListOptionEvent({exerciceOption}):super(exerciceOption: exerciceOption);
}

