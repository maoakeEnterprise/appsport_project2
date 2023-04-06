part of 'startprogramme_bloc.dart';

@immutable
abstract class StartProgrammeState {
  String? nomExercice;
  String? id;
  StartProgrammeState({this.nomExercice,this.id});
}

class StartProgrammeInitial extends StartProgrammeState {

}
class GetCheckedBoxState extends StartProgrammeState {
  GetCheckedBoxState({nomExercice,id}):super(nomExercice: nomExercice,id: id);
}
class InitCheckedBoxState extends StartProgrammeState {

}
