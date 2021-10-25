import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  //
  final String? payload;

  NotificationScreen({required this.payload});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

    final user = FirebaseAuth.instance.currentUser;
  final List noti = ['su'];
  bool loading = false;

 
  inset()async{
   
    FirebaseFirestore.instance
        .collection('notifications').
       add({
         'userId': user!.uid,
         'createdAt':DateTime.now(),
         "noti": widget.payload});
  }

  @override
  void initState() {
    print(widget.payload);
    if(widget.payload!=null)
     {inset();}
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notifications Screen'),
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('notifications').where("userId", isEqualTo: user!.uid).orderBy("createdAt",descending: true).
                snapshots(),
            builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final documents = streamSnapshot.data!.docs;

              return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) => ListTile(
                        title: Text(documents[index]['noti'].toString()),
                      ));
            }));
  }
}
