

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finallygod/Modals/vacination.dart';
import 'package:finallygod/screens/disease_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class ImmuneDetails extends StatefulWidget {
  final List<Vaccination> vaccination;
  ImmuneDetails(this.vaccination);
 

  @override
  _ImmuneDetailsState createState() => _ImmuneDetailsState();
}

class _ImmuneDetailsState extends State<ImmuneDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Immunization Schedule"),
       // backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle:true),
      //  backgroundColor: Theme.of(context).colorScheme.background,
        body: 
      ListView.builder(
        itemCount: widget.vaccination.length,
        itemBuilder: (context,index)=>Card(
          child: ListTile(
            title: Text(widget.vaccination[index].disease),
 // subtitle: Text(widget.vaccination[index].disease),
            onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>DiseaseDetails(widget.vaccination[index]))),
            
          ),
        ))
    );
  }
}