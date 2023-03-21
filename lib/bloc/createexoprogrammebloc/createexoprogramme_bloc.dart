import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'createexoprogramme_event.dart';
part 'createexoprogramme_state.dart';

class CreateExoProgrammeBloc extends Bloc<CreateExoProgrammeEvent, CreateExoProgrammeState> {
  CreateExoProgrammeBloc() : super(CreateExoProgrammeInitial()) {
    on<CreateExoProgrammeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<RadioListOptionEvent>((event, emit) {
      // TODO: implement event handler
      emit(OptionState(exerciceOption: event.exerciceOption,poids: event.poids,repetitions: event.repetitions));
    });
  }
}
