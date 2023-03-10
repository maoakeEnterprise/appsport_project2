part of 'createexercice_bloc.dart';

@immutable
abstract class CreateExerciceEvent {
  String? titleExercice;
  String? nameMuscle;
  CreateExerciceEvent({this.titleExercice,this.nameMuscle});
}
class PectoreauxEvent extends CreateExerciceEvent{
  PectoreauxEvent({titleExercice}):super(titleExercice: titleExercice);
}
class DosEvent extends CreateExerciceEvent{
  DosEvent({titleExercice}):super(titleExercice: titleExercice);
}
class BicepsEvent extends CreateExerciceEvent{
  BicepsEvent({titleExercice}):super(titleExercice: titleExercice);
}
class JambeEvent extends CreateExerciceEvent{
  JambeEvent({titleExercice}):super(titleExercice: titleExercice);
}
class TricepsEvent extends CreateExerciceEvent{
  TricepsEvent({titleExercice}):super(titleExercice: titleExercice);
}
class AbdosEvent extends CreateExerciceEvent{
  AbdosEvent({titleExercice}):super(titleExercice: titleExercice);
}
class EpauleEvent extends CreateExerciceEvent{
  EpauleEvent({titleExercice}):super(titleExercice: titleExercice);
}
class TitleExerciceChangeEvent extends CreateExerciceEvent{
  TitleExerciceChangeEvent({titleExercice,nameMuscle}):super(titleExercice: titleExercice,nameMuscle: nameMuscle);
}
