
import 'dart:convert';

import 'package:finallygod/Providers/api_manager.dart';
import 'package:finallygod/Providers/covid.dart';

import 'package:finallygod/screens/covid/coroanadetail.dart';
import 'package:finallygod/screens/covid/corona_details.dart';
import 'package:finallygod/widgets/covidchart.dart';
import 'package:finallygod/widgets/search.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Test extends StatefulWidget {
   

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  Future<Covid>? _covid;

  List<dynamic> filer = [];
  
  var fil;
  bool click=false;
int latest=0;

  @override
  void initState() {
    _covid = API().getdata();

    print(_covid);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
     title: Text('Corona Update'),
     centerTitle: true,
     actions: [
       IconButton(onPressed:(){setState(() {
         click=true;
       });} , icon: Icon(Icons.search))
     ],

    ),
body: FutureBuilder<Covid>(
        future: _covid,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return 
    
  SingleChildScrollView(
    child: Column(
     
            children: [
             if(click)  TextField(
                  
                  decoration: InputDecoration(
                    
                      contentPadding: EdgeInsets.all(15.0),
                      prefixIcon: Icon(Icons.search),
                      hintText: "Search Country"),
                  onChanged: (value) {
                    setState(() {
                      filer = snapshot.data!.countries
                          .where((element) =>
                              (element.slug.contains(value.toLowerCase())))
                          .toList();
                      print(filer);
                    });
                  },
                ),
  
                 if (click)
                  Container(
                    height: MediaQuery.of(context).size.height/1.2,
                    child: ListView.builder(
                        itemCount: filer.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                                key:
                                    Key(snapshot.data!.countries[index].toString()),
                                title: Text(filer[index].country,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400),),
                                trailing: FaIcon(FontAwesomeIcons.handPointUp,),
                                onTap: () {
                                     setState(() {
                                       click=false;
                                       latest=   index;
                                     });
     
                                }
     
     
                                ),
                          );
                        }),
                  ),
            if(!click)  Row(
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
             if(!click) SizedBox(height: 65,),
             if(!click) Container(
               height: 50,
               width: double.infinity,
               padding: EdgeInsets.all(10),
               child: FittedBox(child: Text("${filer.isNotEmpty? filer[latest].country:snapshot.data!.countries[121].country}'s Data",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold),))),
              
              if(!click)  Container(
                height: 285,
                child: CoronaDetailssss(filer.isNotEmpty? filer[latest]:snapshot.data!.countries[121])),
                
     
          
            ],
          
        
     ),
  );
         
      
    
      
    
        }));
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
           ],

    );
  
  
    
  }
}