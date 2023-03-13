part of 'createexoprogramme_bloc.dart';

@immutable
abstract class CreateExoProgrammeState {
  String? exerciceOption;
  CreateExoProgrammeState({this.exerciceOption});
}

class CreateExoProgrammeInitial extends CreateExoProgrammeState {}
class OptionState extends CreateExoProgrammeState{
  OptionState({exerciceOption}):super(exerciceOption: exerciceOption);
}

