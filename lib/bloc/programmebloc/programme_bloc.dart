import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'programme_event.dart';
part 'programme_state.dart';

class ProgrammeBloc extends Bloc<ProgrammeEvent, ProgrammeState> {
  ProgrammeBloc() : super(ProgrammeInitial()) {
    on<ProgrammeEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<NomProgrammeEvent>((event, emit) {
      // TODO: implement event handler
      emit(ProgrammeValidateState(nom: event.nomProgramme));
    });
  }
}
