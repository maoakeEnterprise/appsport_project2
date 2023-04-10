part of 'graph_prgramme_bloc.dart';

@immutable
abstract class GraphPrgrammeState {
  String? exercice;
  double? moduloValue;
  String? nomTickWidget;
  GraphPrgrammeState({this.exercice,this.moduloValue,this.nomTickWidget});
}

class GraphPrgrammeInitial extends GraphPrgrammeState {

}
class GraphPrgrammeExerciceState extends GraphPrgrammeState {
  GraphPrgrammeExerciceState({exercice,moduloValue,nomTickWidget}):super(exercice: exercice,moduloValue: moduloValue,nomTickWidget: nomTickWidget);
}
