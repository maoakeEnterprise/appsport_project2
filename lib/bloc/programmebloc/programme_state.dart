part of 'programme_bloc.dart';

@immutable
abstract class ProgrammeState {
  String? nomProgramme;
  ProgrammeState({this.nomProgramme});
}

class ProgrammeInitial extends ProgrammeState {}

class ProgrammeValidateState extends ProgrammeState{
  ProgrammeValidateState({nom}):super(nomProgramme: nom);
}
