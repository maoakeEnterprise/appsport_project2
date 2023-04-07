part of 'startprogramme_bloc.dart';

@immutable
abstract class StartProgrammeState {
  String? nomExercice;
  int? id;
  List<int> listId;
  StartProgrammeState({this.nomExercice,this.id,required this.listId});
}

class StartProgrammeInitial extends StartProgrammeState {
  StartProgrammeInitial({required super.listId});

}
class GetCheckedBoxState extends StartProgrammeState {
  GetCheckedBoxState({nomExercice,id,listId}):super(nomExercice: nomExercice,id: id,listId: listId);
}
class InitCheckedBoxState extends StartProgrammeState {
  InitCheckedBoxState({required super.listId});

}
