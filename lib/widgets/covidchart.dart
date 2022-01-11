import 'dart:math';

import 'package:flutter/material.dart';
class PieCharttt extends StatelessWidget {
  const PieCharttt({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        fontFamily: "Lato",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black);
    return  Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(top:40,left: 10),
               // padding: EdgeInsets.only(left: 20,top: 20),
                height: size.width / 4,
                width: size.width / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Stack(
                  children: [
                    Center(
                      child: CustomPaint(
                        foregroundPainter: Chart(),
                        child: Container(),
                      ),
                    ),
                  
                    
                  ],
                ),
              );
  }
}
class Chart extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    Offset center = Offset(size.height / 2, size.width / 2);
    double radius = min(size.height / 2, size.width / 2);
    var paint = new Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 40;
      List<Color> color=[Colors.orange.shade300,Colors.green.shade300,Colors.red.shade300];
    double total = 29742528;
    var currentval = [ 730479,680815,10259];
    var startradian = pi/2;
    for( int i=0;i<3;i++){
      var   current=currentval[i];
      var sweepradian = (current / total) * 80 * pi;
    paint.color = color[i];
    
  
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), startradian,
        sweepradian, false, paint);
    startradian += sweepradian;

    }
    
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
