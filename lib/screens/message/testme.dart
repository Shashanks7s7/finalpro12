

import 'package:finallygod/screens/message/widgets/messageinput.dart';
import 'package:finallygod/screens/message/widgets/messages.dart';
import 'package:flutter/material.dart';
class Tes extends StatelessWidget {
  const Tes({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(children: [
          Expanded(
            child: Messages(),
          ),
         // FittedBox(child: MessageBubble('hululu')),
          MessageInput()
        ]),
      );
  }
}
