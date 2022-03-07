import 'package:finallygod/Modals/api_manager.dart';
import 'package:finallygod/Modals/covid.dart';
import 'package:finallygod/screens/covid/test.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Search extends StatefulWidget {
 
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
                            }
                           

                            ),
                          
                      );
                    }),
              )

          ]);})
    );
    // final arguments= ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
   

  }}