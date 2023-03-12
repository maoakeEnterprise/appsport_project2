part of 'createexercice_bloc.dart';

@immutable
abstract class CreateExerciceEvent {
  String? titleExercice;
  String? nameMuscle;
  String? idMuscle;
  String? type;
  CreateExerciceEvent({this.titleExercice,this.nameMuscle,this.idMuscle,this.type});
}
class PectoreauxEvent extends CreateExerciceEvent{
  PectoreauxEvent({titleExercice,idMuscle,type}):super(titleExercice: titleExercice,idMuscle: idMuscle,type: type);
}
class DosEvent extends CreateExerciceEvent{
  DosEvent({titleExercice,idMuscle,type}):super(titleExercice: titleExercice,idMuscle: idMuscle,type: type);
}
class BicepsEvent extends CreateExerciceEvent{
  BicepsEvent({titleExercice,idMuscle,type}):super(titleExercice: titleExercice,idMuscle: idMuscle,type: type);
}
class JambeEvent extends CreateExerciceEvent{
  JambeEvent({titleExercice,idMuscle,type}):super(titleExercice: titleExercice,idMuscle: idMuscle,type: type);
}
class TricepsEvent extends CreateExerciceEvent{
  TricepsEvent({titleExercice,idMuscle,type}):super(titleExercice: titleExercice,idMuscle: idMuscle,type: type);
}
class AbdosEvent extends CreateExerciceEvent{
  AbdosEvent({titleExercice,idMuscle,type}):super(titleExercice: titleExercice,idMuscle: idMuscle,type: type);
}
class EpauleEvent extends CreateExerciceEvent{
  EpauleEvent({titleExercice,idMuscle,type}):super(titleExercice: titleExercice,idMuscle: idMuscle,type: type);
}
class TitleExerciceChangeEvent extends CreateExerciceEvent{
  TitleExerciceChangeEvent({titleExercice,nameMuscle,idMuscle,type}):super(titleExercice: titleExercice,nameMuscle: nameMuscle,idMuscle: idMuscle,type: type);
}
class CloseEvent extends CreateExerciceEvent{
  CloseEvent({titleExercice,nameMuscle,idMuscle,type}):super(titleExercice: titleExercice,nameMuscle: nameMuscle,idMuscle: idMuscle,type: type);
}
class RebootCreateExerciceEvent extends CreateExerciceEvent{}

