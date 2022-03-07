import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'messagebubble.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var u = user!.uid;
    return FutureBuilder(
        future: Future.value(auth.FirebaseAuth.instance.currentUser),
        builder: (ctx, AsyncSnapshot futuresnapshot) {
          if (futuresnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection("chat")
                  .doc(user.uid)
                  .collection("users")
                  .orderBy('createdat', descending: true)
                  .snapshots(),
              builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if (streamSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (streamSnapshot.data == null) {
                  return CircularProgressIndicator();
                }

                final documents = streamSnapshot.data!.docs;

                return ListView.builder(
                  reverse: true,
                  itemCount: documents.length,
                  itemBuilder: (ctx, index) => Container(
                    padding: EdgeInsets.all(8),
                    child: MessageBubble(
                        documents[index]['text'],
                        documents[index]['username'],
                        documents[index]['imageurl'],
                        documents[index]['userId'].toString() == user.uid,
                        keys: ValueKey(documents[index].id)),
                  ),
                );
              });
        });
  }
}
