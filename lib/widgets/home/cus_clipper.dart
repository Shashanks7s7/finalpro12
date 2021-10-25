import 'package:flutter/cupertino.dart';

class WaveCliper extends CustomClipper<Path>{
    @override
   Path getClip (Size size)  {
   debugPrint(size.width.toString());
      var path = new Path();
      path.lineTo(0, size.height-15);
      var firststart = Offset(size.width/2, size.height-5);
       var firstend = Offset(size.width/2,size.height-50.0);
      path.quadraticBezierTo(firststart.dx, firststart.dy, firstend.dx, firstend.dy);

      var secondstart = Offset(size.width-(size.width/2), size.height-80);
      var secondend = Offset(size.width,size.height-35);
      path.quadraticBezierTo(secondstart.dx,secondstart.dy, secondend.dx,secondend.dy);
      path.lineTo(size.width,-0);
      path.close();
      return path;
      
    }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }

 

  }