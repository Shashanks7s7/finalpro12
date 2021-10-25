

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finallygod/Providers/vacination.dart';
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
        body: /*FutureBuilder(
      future:  Future.value(FirebaseAuth.instance.currentUser),
      builder: (ctx, AsyncSnapshot futuresnapshot){
        if(futuresnapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }
        return StreamBuilder(
   
          stream:  FirebaseFirestore.instance.collection('immunization').snapshots() ,
          builder: ( ctx, AsyncSnapshot<QuerySnapshot> streamSnapshot){
            if(streamSnapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
            }

            
         final documents = streamSnapshot.data!.docs;
        
            return ListView.builder(
              itemCount: documents.length,
              itemBuilder: (ctx,index){
                return
               Card(
                 elevation: 2,
                 child: ListTile(
                   leading: CircleAvatar(child: Text((index+1).toString(),textAlign: TextAlign.center, ),),
                   title:Text( documents[index]['title'].toString()),
                   subtitle: Text("What for:  ${documents[index]['whatfor'].toString()}"),
                   trailing: SizedBox(child: Text("When ${documents[index]['when'].toString()}"),),
                   
               
                 ),
               );
              });
          },
          );
      })*/
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