import 'dart:ui';

import 'package:finallygod/widgets/authcard.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color.fromRGBO(243, 210, 193, 0.6),Colors.red],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
        // height: 200,
        // width: double.infinity,
        //  color: Theme.of(context).accentColor,
        child: Container(
          child: Column(
            //   clipBehavior: Clip.none,
            children: [
              Center(
                child: FaIcon(
                  FontAwesomeIcons.syringe,
                  color: Colors.white,
                  size: 100,
                ),
              ),
              /* Positioned(
                   right:0,
                   top:113,
                   child: Container(
                     height: 75,
                     width: 135,
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(45),
                      color: Theme.of(context).accentColor) 
                   ,),
                 ),
                   Positioned(
                   right: 90,
                   top:125,
                   child: Container(
                     height: 50,
                     width: 100,
                     decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(155),
                      color: Colors.blue) 
                   ,),
                 )*/
              SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  height: 60,
                  width: 220,
                  padding: EdgeInsets.all(8),

                  child: Text(
                    "Immunization",
                    style:
                        TextStyle(fontSize: 33, fontWeight: FontWeight.normal),
                  ),
                  // transform: Matrix4.rotationZ(-0 * pi / 100),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 139, 167, 1),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 18,
                            offset: Offset(0, 2))
                      ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Flexible(child: AuthCard())
            ],
          ),
        ),
      ),
    );
  }
}
