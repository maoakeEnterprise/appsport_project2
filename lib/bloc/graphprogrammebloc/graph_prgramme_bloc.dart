
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'graph_prgramme_event.dart';
part 'graph_prgramme_state.dart';

class GraphPrgrammeBloc extends Bloc<GraphPrgrammeEvent, GraphPrgrammeState> {
  GraphPrgrammeBloc() : super(GraphPrgrammeInitial()) {
    on<GraphPrgrammeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GraphPageEvent>((event, emit){
      emit(GraphPrgrammeExerciceState(exercice: event.exercice,moduloValue: event.moduloValue,nomTickWidget: event.nomTickWidget));
    });
  }
}
