import 'package:finallygod/Providers/covid.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class CoronaDetailssss extends StatelessWidget {
   Country covid;
  CoronaDetailssss(this.covid);
 

  @override
  Widget build(BuildContext context) {
     
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(10),
       // width: MediaQuery.of(context).size.width / 0.2,
        
      child:GridView.count(
        crossAxisCount: 3,
         mainAxisSpacing: 10,
              crossAxisSpacing: 5,
        children: [
          Dabba(FaIcon(FontAwesomeIcons.viruses,size: 25,color: Colors.grey.shade600,), "Total Infected", covid.totalConfirmed.toString()),
           Dabba(FaIcon(FontAwesomeIcons.sadCry,size: 25,color: Colors.red.shade400,), "Total Death", covid.totalDeaths.toString()),
            Dabba(FaIcon(FontAwesomeIcons.smileBeam,size: 25,color: Colors.orange.shade400,), "Total Recovered", covid.totalRecovered.toString()),
  Dabba(FaIcon(FontAwesomeIcons.virus,size: 25,color: Colors.grey.shade600,), "New Infected", covid.newConfirmed.toString()),
           Dabba(FaIcon(FontAwesomeIcons.sadTear,size: 25,color: Colors.red.shade400,), "New Death", covid.newDeaths.toString()),
            Dabba(FaIcon(FontAwesomeIcons.smile,size: 25,color: Colors.orange.shade400,), "New Recoverd", covid.newRecovered.toString())


        ],
        )
      
    );
  }
  Widget Dabba( FaIcon faIcon,String title,String number){
    var textStyle = TextStyle(
        fontFamily: "Lato",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black);
    return  Card(
      elevation: 8,
                 
                  child: Stack(children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: faIcon
                          ),
                          Container(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.bottomCenter,
                              child: FittedBox(child: Text(title))),
                          Container(
                              padding: EdgeInsets.all(6),
                              alignment: Alignment.bottomCenter,
                              child: FittedBox(
                                  child: Text(
                               number,
                                style: textStyle,
                              ))),
                        ]),
                  ]),
                );
  }
}