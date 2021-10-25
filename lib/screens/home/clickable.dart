import 'package:flutter/material.dart';

class Clickable extends StatelessWidget {
  const Clickable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var textStyle = TextStyle(
        fontFamily: "Lato",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary);
    return Container(
      padding: EdgeInsets.all(10),
      height: size.height / 2.3,
      
      //  width: size.height/2,
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          GestureDetector(
            onTap: ()=>Navigator.of(context).pushNamed("form"),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.green[400]),
           child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned.fill(
                   
                    child: Container(
                        //     alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green[600],
                            // borderRadius: BorderRadius.circular(20)
                       /*   boxShadow: [
                              BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-7, -7),
                                  blurRadius: 3,
                                  spreadRadius: 5)
                            ]*/
                            )),
                            
                  ),
                  
                  Positioned.fill(
                    top: -20,
                    right: -50,
                    child: Container(
                        //     alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green[400],))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Register',
                          style: textStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed('immunedetail'),
            child: Container(
              padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue[400]),
              child: Stack(
             clipBehavior: Clip.hardEdge,
                children: [
                  Positioned.fill(
                  left: -150,
                  top: 20,
                  bottom: 20,
                    child: Container(
          
                        //     alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                       
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue[600],
                            // borderRadius: BorderRadius.circular(20)
                          /*  boxShadow: [
                              BoxShadow(
                                  color: Colors.orange,
                                  offset: Offset(-5, -5),
                                  blurRadius: 30,
                                  spreadRadius: 5)
                            ]*/
                            )),
                  ),
                   Positioned(
                    top: 85,
                    right: 30,
                    child: Container(
                        //     alignment: Alignment.center,
                        margin: EdgeInsets.all(12),
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue[500],
                        ))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.health_and_safety,
                        color: Colors.white,
                        size: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'About Vaccine',
                          style: textStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed('covid'),
            child: Container(
              //padding: EdgeInsets.all(1),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange[400]),
          
              child: Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    top: -32,
                    right: 8,
                    child: Container(
                        //     alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 50,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.orange[600],
                            // borderRadius: BorderRadius.circular(20)
                          /*  boxShadow: [
                              BoxShadow(
                                  color: Colors.orange,
                                  offset: Offset(-5, -5),
                                  blurRadius: 30,
                                  spreadRadius: 5)
                            ]*/
                            )),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.dangerous,
                        color: Colors.white,
                        size: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Covid Update',
                          style: textStyle,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
              onTap: ()=>Navigator.of(context).pushNamed('map'),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  
                  color: Colors.red[400]),
              child:  Stack(
                clipBehavior: Clip.hardEdge,
                children: [
                  Positioned(
                    bottom: -22,
                    right: 6,
                    child: Container(
                        //     alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 35,
                        width: 15,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.red[700],
                            // borderRadius: BorderRadius.circular(20)
                          /*  boxShadow: [
                              BoxShadow(
                                  color: Colors.orange,
                                  offset: Offset(-5, -5),
                                  blurRadius: 30,
                                  spreadRadius: 5)
                            ]*/
                            )),
                  ),
                     Positioned(
                    bottom: -22,
                    right: 28,
                    child: Container(
                        //     alignment: Alignment.center,
                        margin: EdgeInsets.all(10),
                        height: 25,
                        width: 15,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: Colors.red[700],))),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.map,
                        color: Colors.white,
                        size: 50,
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        alignment: Alignment.bottomCenter,
                        child: FittedBox(
                          child: Text(
                            'Nearby Hospitals',
                            style: textStyle,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
