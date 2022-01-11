import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

import "package:latlong2/latlong.dart" ;
import 'package:location/location.dart' as package;


class MapScreen extends StatefulWidget {
  const MapScreen({ Key? key }) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
   double? lat;
   double? long;
   bool isloading=false;
   Future<void> getcurrentlocation()async{
     
     setState(() {
       isloading=true;
     });
     final currentloc=await package.Location().getLocation();
     setState(() {
       lat=currentloc.latitude;
       long=currentloc.longitude;
       isloading=false;
     });
   }
@override
  void initState() {
    getcurrentlocation();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nearby Hospital"),
        centerTitle:true
      ),
      body:isloading?Center(child: CircularProgressIndicator(),): FlutterMap(
    options: MapOptions(
        center: LatLng( lat??28.3974,long??  84.1258),
        zoom: 17.0,
    ),
    layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          additionalOptions: {
            'accessToken':'pk.eyJ1Ijoic2hhc2hhbms3IiwiYSI6ImNrcnhrNDM1ZDBuNzYybm1rdXZpejAwYW8ifQ.8RqMdasNkLjhToDUctAIpA'
          },
          maxZoom: 100,
          minZoom: 1,
         subdomains: ['a', 'b', 'c']
        ),
        
        
        MarkerLayerOptions(
          markers: [
            Marker(
              width: 120.0,
              height:120.0,
              point: LatLng(lat==null?28.3974:lat!,long==null?  84.1258:long!),
              builder: (ctx) =>
              Container(
                child: IconButton(onPressed: (){}, icon: Icon(Icons.location_on,color: Colors.red,))
            ),
            )],
        ),
    ],),
      
  );
  }
}