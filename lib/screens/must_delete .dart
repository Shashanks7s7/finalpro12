import 'dart:convert';

import 'package:finallygod/Providers/api_manager.dart';
import 'package:finallygod/Providers/covid.dart';

import 'package:finallygod/screens/covid/coroanadetail.dart';
import 'package:finallygod/widgets/search.dart';
import 'package:flutter/material.dart';

class CovidScre extends StatefulWidget {
  
  @override
  _CovidScreState createState() => _CovidScreState();
}

class _CovidScreState extends State<CovidScre> {
  Future<Covid>? _covid;

  List<dynamic> filer = [];

  var fil;

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
        title: Text("Covid Update"),
        centerTitle: true,
        //backgroundColor: Theme.of(context).colorScheme.primary,
      ),
     // backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<Covid>(
        future: _covid,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(children: [
            TextField(
              
              decoration: InputDecoration(
                
                  contentPadding: EdgeInsets.all(15.0),
                  prefixIcon: Icon(Icons.search),
                  hintText: "Nepal"),
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
            if (filer.isEmpty)
            
                        
                  
            if (filer.isNotEmpty)
              Expanded(
                child: ListView.builder(
                    itemCount: filer.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            key:
                                Key(snapshot.data!.countries[index].toString()),
                            title: Text(filer[index].country),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CoronaDetails(filer[index])));
                            }


                            ),
                      );
                    }),
              )
          ]);
        },
      ),
    );
  }
}
