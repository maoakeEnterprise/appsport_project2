import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'createexercice_event.dart';
part 'createexercice_state.dart';

class CreateExerciceBloc extends Bloc<CreateExerciceEvent, CreateExerciceState> {
  CreateExerciceBloc() : super(CreateExerciceInitial()) {
    on<PectoreauxEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "pectoraux",nameExercice: event.titleExercice,idMuscle: event.idMuscle,type: event.type));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "pectoraux",idMuscle: event.idMuscle,type: event.type));
      }
    });
    on<DosEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle:"dos",nameExercice: event.titleExercice,idMuscle: event.idMuscle,type: event.type));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "dos",idMuscle: event.idMuscle,type: event.type));
      }
    });
    on<BicepsEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "biceps",nameExercice: event.titleExercice,idMuscle: event.idMuscle,type: event.type));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "biceps",idMuscle: event.idMuscle,type: event.type));
      }
    });
    on<JambeEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "jambe",nameExercice: event.titleExercice,idMuscle: event.idMuscle,type: event.type));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "jambe",idMuscle: event.idMuscle,type: event.type));
      }
    });
    on<TricepsEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "triceps",nameExercice: event.titleExercice,idMuscle: event.idMuscle,type: event.type));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "triceps",idMuscle: event.idMuscle,type: event.type));
      }
    });
    on<AbdosEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "abdos",nameExercice: event.titleExercice,idMuscle: event.idMuscle,type: event.type));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "abdos",idMuscle: event.idMuscle,type: event.type));
      }
    });
    on<EpauleEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "epaule",nameExercice: event.titleExercice,idMuscle: event.idMuscle,type: event.type));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "epaule",idMuscle: event.idMuscle,type: event.type));
      }
    });
    on<TitleExerciceChangeEvent>((event, emit) {
      // TODO: implement event handler
      emit(ValidateExerciceState(nameMuscle: event.nameMuscle,nameExercice: event.titleExercice,idMuscle: event.idMuscle,type: event.type));
    });
    on<CloseEvent>((event, emit) {
      // TODO: implement event handler
      emit(ValidateExerciceState());
    });
    on<RebootCreateExerciceEvent>((event, emit) {
      // TODO: implement event handler
      emit(SelectedMuscleState());
    });
  }
}
