import 'package:finallygod/screens/message/widgets/messageinput.dart';
import 'package:finallygod/screens/message/widgets/messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat App',
            style: TextStyle(
                color: Theme.of(context).primaryColorDark,
                fontSize: 28,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondaryVariant,
       
          
      ),
      body:/*StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .snapshots(),
        builder: (ctx, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final documents = streamSnapshot.data!.docs;
          return ListView.builder(
            itemCount: documents.length,
            itemBuilder: (ctx, index) => Container(
              padding: EdgeInsets.all(8),
              child: Text(documents[index]['text']),
            ),
          );
        },
      ),*/
      
      
      Container(
        child: Column(children: [
          Expanded(
            child: Messages(),
          ),
         // FittedBox(child: MessageBubble('hululu')),
          MessageInput()
        ]),
      ),
      
    );
  }
}