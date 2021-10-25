import 'dart:convert';

import 'package:finallygod/Providers/covid.dart';
import 'package:http/http.dart' as http;
class API {
 Future<Covid> getdata()async{
   var covidmodel=null;
   var client=http.Client();
try{
  var response= await  client.get(Uri.parse('https://api.covid19api.com/summary'));
  print(response);
   if(response.statusCode==200){
     var jsonString= response.body;
     var jsonMap=json.decode(jsonString);
     covidmodel= Covid.fromJson(jsonMap);
   }}catch (Exception) {
     
    return covidmodel;
   }
  
   return covidmodel;
   
 } 
}