part of 'startprogramme_bloc.dart';

@immutable
abstract class StartProgrammeEvent {
  String? nomExercice;
  String? id;
  StartProgrammeEvent({this.nomExercice,this.id});
}

class BoxGetCheckedEvent extends StartProgrammeEvent{
  BoxGetCheckedEvent({nomExercice,id}):super(nomExercice: nomExercice,id: id);
}
class InitBoxGetCheckedEvent extends StartProgrammeEvent{
}
