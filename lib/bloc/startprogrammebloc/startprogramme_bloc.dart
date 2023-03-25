import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'startprogramme_event.dart';
part 'startprogramme_state.dart';

class StartProgrammeBloc extends Bloc<StartProgrammeEvent, StartProgrammeState> {
  StartProgrammeBloc() : super(StartProgrammeInitial()) {
    on<StartProgrammeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<BoxGetCheckedEvent>((event, emit) {
      // TODO: implement event handler
      emit(GetCheckedBoxState(nomExercice: event.nomExercice));
    });
    on<InitBoxGetCheckedEvent>((event, emit) {
      // TODO: implement event handler
      emit(InitCheckedBoxState());
    });
  }
}
