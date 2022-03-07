import 'dart:convert';

import 'package:finallygod/Modals/covid.dart';
import 'package:http/http.dart' as http;
class API {
 Future<Covid> getdata()async{
   var covidmodel=null;
   var client=http.Client();
   print("55");
try{
  print("object");
  var response= await  http.get(Uri.parse('https://api.covid19api.com/summary'));
   print("yy00");
   if(response.statusCode==200){
     var jsonString= response.body;
     var jsonMap=json.decode(jsonString);
     covidmodel= Covid.fromJson(jsonMap);
     print("lo");
   }}catch (Exception) {
     print("hjk");
     print(covidmodel);
    return covidmodel;
   }
   print("hjk");
   return covidmodel;
   
   
 } 
}