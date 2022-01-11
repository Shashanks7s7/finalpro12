import 'dart:math';

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class List_View extends StatefulWidget {
  @override
  _List_ViewState createState() => _List_ViewState();
}

class _List_ViewState extends State<List_View> {
  List<charts.Series<dynamic, String>> serieslist = [];

  static List<charts.Series<Vac, String>> createData() {
    final data = [
     
      Vac("DPT-HepB-HiB", 6),
      Vac("OPV", 6),
      Vac("PCV", 6),
      Vac("BCG", 1),
      Vac("MR", 36),
     
    ];
    final data1 = [
      
      Vac("DPT-HepB-HiB", 10),
      Vac("OPV", 10),
      Vac("PCV", 10),
      Vac("MR", 60),
       Vac("JE", 48),
        Vac('IPV', 14),
    ];
    final data2 = [Vac("DPT-HepB-HiB", 14), Vac("OPV", 14), Vac("PCV", 36)];
    return [
      new charts.Series<Vac, String>(
          id: "Vac",
          domainFn: (Vac vac, _) => vac.vaccine,
          measureFn: (Vac vac, _) => vac.time,
          data: data,
            colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) =>
            charts.MaterialPalette.blue.shadeDefault.lighter,
          ),
      new charts.Series<Vac, String>(
          id: "Vac1",
          domainFn: (Vac vac, _) => vac.vaccine,
          measureFn: (Vac vac, _) => vac.time,
          data: data1,
          colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault.lighter,),
      new charts.Series<Vac, String>(
          id: "Vac2",
          domainFn: (Vac vac, _) => vac.vaccine,
          measureFn: (Vac vac, _) => vac.time,
          data: data2,
           colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        fillColorFn: (_, __) => charts.MaterialPalette.green.shadeDefault.lighter,)
    ];
  }

  barChart() {
    return charts.BarChart(
      serieslist,
      animate: true,
      vertical: false,
    );
  }

  @override
  void initState() {
    serieslist = createData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(left:10,right: 10,bottom: 20,),
      height: size.height / 1.7,
      child: barChart(),
    );
  }
}

class Vac {
  final String vaccine;
  final int time;
  Vac(this.vaccine, this.time);
}
