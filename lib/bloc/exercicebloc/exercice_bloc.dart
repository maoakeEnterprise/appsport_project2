import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'exercice_event.dart';
part 'exercice_state.dart';

class ExerciceBloc extends Bloc<ExerciceEvent, ExerciceState> {
  ExerciceBloc() : super(ExerciceInitial()) {
    on<SearchExoEvent>((event, emit) {
      emit((ExerciceLoadingState(valSearching: event.val)));
      emit((ExerciceSuccessState(valSearching: event.val)));
    });
    on<HautDuCorpsEvent>((event, emit) {
      // TODO: implement event handler
      emit(ExerciceLoadingState(type: "haut"));
      emit(ExerciceSuccessState(type: "haut"));
    });
    on<BrasEvent>((event, emit) {
      // TODO: implement event handler
      emit(ExerciceLoadingState(type: "bras"));
      emit(ExerciceSuccessState(type: "bras"));
    });
    on<BasDuCorpsEvent>((event, emit) {
      // TODO: implement event handler
      emit(ExerciceLoadingState(type: "bas"));
      emit(ExerciceSuccessState(type: "bas"));
    });
  }
}
