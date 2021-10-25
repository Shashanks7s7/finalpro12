import 'dart:math';

import 'package:flutter/material.dart';
class PieChart extends StatelessWidget {
  final int data;
  PieChart(this.data);
 

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        fontFamily: "Lato",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black);
    return  Container(
                padding: EdgeInsets.all(10),
                height: size.width / 4,
                width: size.width / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    CustomPaint(
                      foregroundPainter: Chart(data),
                      child: Container(),
                    ),
                    Container(
                      height: size.width / 5,
                      width: size.width / 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    Center(
                        child: Text(
                      "$data%",
                      style: textStyle,
                    )),
                  ],
                ),
              );
  }
}
class Chart extends CustomPainter {
  final int data;
  Chart(this.data);
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Offset center = Offset(size.height / 2, size.width / 2);
    double radius = min(size.height / 2, size.width / 2);
    var paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    double total = 100;
    var startradian = -pi / 4;
    var currentval = data;
    var sweepradian = (currentval / total) * 2 * pi;
    paint.color = Colors.green;
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startradian,
        sweepradian, false, paint);
    startradian += sweepradian;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
