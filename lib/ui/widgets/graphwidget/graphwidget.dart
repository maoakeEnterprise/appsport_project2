import 'package:appsport_project/bloc/graphprogrammebloc/graph_prgramme_bloc.dart';
import 'package:appsport_project/model/chart_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphWidget extends StatelessWidget {
  GraphWidget({Key? key}) : super(key: key);
  var db = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData= [];
    var dataSuivie = db.collection('datasuivie').where("idUser", isEqualTo: user.uid).snapshots();

    return Center(
      child: BlocBuilder<GraphPrgrammeBloc, GraphPrgrammeState>(
        builder: (context, state) {
          chartData= [];
          return Column(
            children: [
              StreamBuilder(
                stream: dataSuivie,
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if(snapshot.hasError){
                    return const Text('Error');
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const CircularProgressIndicator();
                  }
                  return Container(
                    height: 1,
                    child: ListView(
                      children: snapshot.data!.docs.map((DocumentSnapshot document){
                        Map<String, dynamic> data =
                        document.data()! as Map<String, dynamic>;
                        if(state.exercice == data['nomExercice']){
                          chartData.add(ChartData(date: DateTime(data['annee'],data['mois'],data['jour']),poids: data['poids']));
                          chartData.sort((a,b){
                            return Comparable.compare(a.date!, b.date!);
                          });
                        }
                        return Container();
                      }).toList(),
                    ),
                  );
                }),
              Container(
                margin: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.deepOrange.withAlpha(30)
                ),
                child: SfCartesianChart(
                  margin: const EdgeInsets.all(0),
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                  plotAreaBorderWidth: 0,
                  primaryXAxis: DateTimeAxis(
                    isVisible: true,
                    interval: state.moduloValue,
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: 120,
                    interval: 10,
                    isVisible: false,
                    borderWidth: 0,

                  ),
                  series: <ChartSeries<ChartData, DateTime>>[
                    SplineAreaSeries(
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.date,
                      yValueMapper: (ChartData data, _) => data.poids,
                      splineType: SplineType.natural,
                      gradient: LinearGradient(
                          colors: [Colors.cyan,
                            Colors.purple.withAlpha(10)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter
                      ),
                    ),
                    SplineSeries(
                      color: Colors.cyan,
                      width: 4,
                      markerSettings: const MarkerSettings(
                        color: Colors.white,
                        borderWidth: 3,
                        borderColor: Colors.cyan,
                        isVisible: true,
                      ),
                      dataSource: chartData,
                      xValueMapper: (ChartData data, _) => data.date,
                      yValueMapper: (ChartData data, _) => data.poids,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
  int transformDate(int annee, int mois, int jour){

    String dateStock = "";
    dateStock = "$annee${transformMoisJour(mois)}${transformMoisJour(jour)}";
    return int.parse(dateStock);
  }
  String transformMoisJour(int value){
    String valueStock;
    if(value < 10){
      valueStock = "0$value";
    }
    else{valueStock = "$value";}
    return valueStock;
}
}
