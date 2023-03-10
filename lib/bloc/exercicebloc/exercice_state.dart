part of 'exercice_bloc.dart';

@immutable
abstract class ExerciceState {
  String? type;
  String? valSearching;
  ExerciceState({this.type,this.valSearching});
}

class ExerciceInitial extends ExerciceState {
  ExerciceInitial({type,valSearching}):super(type: type,valSearching: valSearching);
}

class ExerciceLoadingState extends ExerciceState{
  ExerciceLoadingState({type,valSearching}):super(type: type,valSearching: valSearching);
}

class ExerciceSuccessState extends ExerciceState{
  ExerciceSuccessState({type,valSearching}):super(type: type,valSearching: valSearching);
}
class ExerciceErrorState extends ExerciceState{
  ExerciceErrorState({type,valSearching}):super(type: type,valSearching: valSearching);
}
