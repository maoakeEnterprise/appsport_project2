import 'package:appsport_project/model/chart_data.dart';
import 'package:appsport_project/ui/themes/themes.dart';
import 'package:appsport_project/ui/widgets/graphwidget/graphwidget.dart';
import 'package:appsport_project/ui/widgets/graphwidget/modulowidget.dart';
import 'package:appsport_project/ui/widgets/graphwidget/tickwidget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'package:flutter/material.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {



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
            const SizedBox(height: 20,),
            GraphWidget(),
            TickWidget(),
            ModuloWidget(),
          ],

        ),
      ),
    );
  }
}
