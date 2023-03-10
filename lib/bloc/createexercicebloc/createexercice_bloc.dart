import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'createexercice_event.dart';
part 'createexercice_state.dart';

class CreateExerciceBloc extends Bloc<CreateExerciceEvent, CreateExerciceState> {
  CreateExerciceBloc() : super(CreateExerciceInitial()) {
    on<PectoreauxEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "pectoraux",nameExercice: event.titleExercice));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "pectoraux"));
      }
    });
    on<DosEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle:"dos",nameExercice: event.titleExercice));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "dos"));
      }
    });
    on<BicepsEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "biceps",nameExercice: event.titleExercice));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "biceps"));
      }
    });
    on<JambeEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "jambe",nameExercice: event.titleExercice));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "jambe"));
      }
    });
    on<TricepsEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "triceps",nameExercice: event.titleExercice));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "triceps"));
      }
    });
    on<AbdosEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "abdos",nameExercice: event.titleExercice));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "abdos"));
      }
    });
    on<EpauleEvent>((event, emit) {
      // TODO: implement event handler
      if(event.titleExercice != null){
        emit(SelectedMuscleState(nameMuscle: "epaule",nameExercice: event.titleExercice));
      }
      else{
        emit(SelectedMuscleState(nameMuscle: "epaule"));
      }
    });
    on<TitleExerciceChangeEvent>((event, emit) {
      // TODO: implement event handler
      emit(ValidateExerciceState(nameMuscle: event.nameMuscle,nameExercice: event.titleExercice));
    });
  }
}
