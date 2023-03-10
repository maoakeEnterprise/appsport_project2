import 'package:appsport_project/model/chart_data.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<ChartData> chartData;

    chartData = [
      ChartData(day: 0,poids: 30),
      ChartData(day: 4,poids: 35),
      ChartData(day: 8,poids: 40),
      ChartData(day: 15,poids: 30),
      ChartData(day: 20,poids: 45),
      ChartData(day: 25,poids: 40),
      ChartData(day: 30,poids: 50),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Graph Page"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Graph", style: CustomThemes.widgetName,),
            const SizedBox(height: 20,),
            Center(
              child: Container(
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepOrange.withAlpha(30)
                ),
                child: SfCartesianChart(
                  margin: const EdgeInsets.all(0),
                  borderWidth: 0,
                  borderColor: Colors.transparent,
                  plotAreaBorderWidth: 0,
                  primaryXAxis: NumericAxis(
                    minimum: 0,
                    maximum: 30,
                    isVisible: false,
                    interval: 4
                  ),
                  primaryYAxis: NumericAxis(
                    minimum: 0,
                    maximum: 70,
                    interval: 10,
                    isVisible: false,
                    borderWidth: 0,

                  ),
                  series: <ChartSeries<ChartData,int >>[
                    SplineAreaSeries(
                        dataSource: chartData,
                        xValueMapper: (ChartData data, _)=> data.day,
                        yValueMapper: (ChartData data, _)=> data.poids,
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
                      xValueMapper: (ChartData data, _)=> data.day,
                      yValueMapper: (ChartData data, _)=> data.poids,
                    ),
                  ],
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
