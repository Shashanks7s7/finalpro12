import 'package:finallygod/Modals/covid.dart';
import 'package:finallygod/screens/covid/corona_details.dart';
import 'package:finallygod/widgets/covidchart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CoronaDetails extends StatefulWidget {
  Country covid;
  CoronaDetails(this.covid);

  @override
  _CoronaDetailsState createState() => _CoronaDetailsState();
}

class _CoronaDetailsState extends State<CoronaDetails> {
  @override
  Widget build(BuildContext context) {
    // final arguments= ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    var textStyle = TextStyle(
        fontFamily: "Lato",
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Theme.of(context).colorScheme.onPrimary);
  return Scaffold(
      appBar: AppBar(
        title: Text(widget.covid.country),
        centerTitle: true,
      ),
      //backgroundColor: Colors.white,
    body:SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
       PieCharttt(),
       Container(
       padding: EdgeInsets.only(top: 35),
       height: 120,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
          Tick(" Total Recovered", Colors.green.shade300),
          Tick(" Total Infected", Colors.orange.shade300),
          Tick(" Total Deaths", Colors.red.shade300)
         ],
       ),
       )
            ],
          ),
          SizedBox(height: 65,),
          Text("Total Data",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),
          Container(
            height: 285,
            child: CoronaDetailssss(widget.covid))
      
        ],
      ),
    )
         
      
    
      
    );
  }
  Widget Tick (String title,Color color){
   return   Row(
           children: [
             Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        border: Border.all(width: 2,color: Colors.grey),
        color: color
      ),
             ),
             Text(title,style: TextStyle(color: Colors.blueGrey),)
           ],);


  
}
}
