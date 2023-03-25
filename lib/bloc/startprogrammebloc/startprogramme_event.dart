part of 'startprogramme_bloc.dart';

@immutable
abstract class StartProgrammeEvent {
  String? nomExercice;
  StartProgrammeEvent({this.nomExercice});
}

class BoxGetCheckedEvent extends StartProgrammeEvent{
  BoxGetCheckedEvent({nomExercice}):super(nomExercice: nomExercice);
}
class InitBoxGetCheckedEvent extends StartProgrammeEvent{
}
