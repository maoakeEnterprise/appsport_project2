part of 'startprogramme_bloc.dart';

@immutable
abstract class StartProgrammeEvent {
  String? nomExercice;
  int? id;
  List<int> listId = [];
  StartProgrammeEvent({this.nomExercice,this.id,required this.listId});
}

class BoxGetCheckedEvent extends StartProgrammeEvent{
  BoxGetCheckedEvent({nomExercice,id,listId}):super(nomExercice: nomExercice,id: id,listId: listId);
}
class InitBoxGetCheckedEvent extends StartProgrammeEvent{
  InitBoxGetCheckedEvent({required super.listId});
}
