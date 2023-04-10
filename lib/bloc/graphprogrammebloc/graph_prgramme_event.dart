part of 'graph_prgramme_bloc.dart';

@immutable
abstract class GraphPrgrammeEvent {
  String? exercice;
  double? moduloValue;
  String? nomTickWidget;
GraphPrgrammeEvent({this.exercice,this.moduloValue,this.nomTickWidget});
}
class GraphPageEvent extends GraphPrgrammeEvent{
  GraphPageEvent({exercice,moduloValue, nomTickWidget}):super(exercice: exercice,moduloValue: moduloValue,nomTickWidget: nomTickWidget);
}
