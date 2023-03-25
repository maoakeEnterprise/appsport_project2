part of 'startprogramme_bloc.dart';

@immutable
abstract class StartProgrammeState {
  String? nomExercice;
  StartProgrammeState({this.nomExercice});
}

class StartProgrammeInitial extends StartProgrammeState {

}
class GetCheckedBoxState extends StartProgrammeState {
  GetCheckedBoxState({nomExercice}):super(nomExercice: nomExercice);
}
class InitCheckedBoxState extends StartProgrammeState {

}
