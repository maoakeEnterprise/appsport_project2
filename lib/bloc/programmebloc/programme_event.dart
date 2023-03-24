part of 'programme_bloc.dart';

@immutable
abstract class ProgrammeEvent {
  String? nomProgramme;
  ProgrammeEvent({this.nomProgramme});
}
class NomProgrammeEvent extends ProgrammeEvent{
  NomProgrammeEvent({nom}):super(nomProgramme: nom);
}