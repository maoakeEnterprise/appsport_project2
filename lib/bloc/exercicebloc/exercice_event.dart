part of 'exercice_bloc.dart';

@immutable
abstract class ExerciceEvent {}
class HautDuCorpsEvent extends ExerciceEvent{}
class BrasEvent extends ExerciceEvent{}
class BasDuCorpsEvent extends ExerciceEvent{}
// ignore: must_be_immutable
class SearchExoEvent extends ExerciceEvent{
  String? val;
  SearchExoEvent(this.val);
}
