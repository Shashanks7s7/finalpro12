
import'package:flutter/material.dart';
class MessageBubble extends StatelessWidget {
  final String text;
  final String name;
  final String url;
  final bool isme;
  final Key keys;
  MessageBubble(this.text,this.name,this.url,this.isme,{required this.keys});
   

  @override
  
  Widget build(BuildContext context) {
    
    return Stack(
          children:[ Row(
        mainAxisAlignment: isme?MainAxisAlignment.end:MainAxisAlignment.start,
        children: [
         
          SizedBox(width:5),
          Container(

            decoration: BoxDecoration(
              color:isme?Theme.of(context).colorScheme.secondaryVariant:Colors.grey[700],
              borderRadius: BorderRadius.only(
                topRight:Radius.circular(18),
                topLeft: Radius.circular(18),
                bottomRight: isme? Radius.circular(0):Radius.circular(18),
                bottomLeft: isme?Radius.circular(18):Radius.circular(0)
              )
            ),
            width: 160,
            padding: EdgeInsets.symmetric(
              horizontal:16,
              vertical:10
            ),
            margin: EdgeInsets.symmetric(
                 vertical: 4,horizontal: 2
            ),
            child: Column(
              crossAxisAlignment: isme?CrossAxisAlignment.end:CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:2),
                  child: Text(name.toString(),style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  //  fontStyle: FontStyle.italic,
                    color: isme?Colors.white:Colors.white70,),),
                ),
                Text(text,style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                //  fontStyle: FontStyle.italic,
                  color: isme?Colors.white:Colors.white60,),
                  
                  ),
              ],
            ),
            
          ),
        ],
      ),
       Positioned(
         top: -8,
         left: !isme?130:null,
         right: !isme?null:130,
         child: CircleAvatar(backgroundImage: url==null?null:NetworkImage(url),)),
      ],clipBehavior: Clip.none,
    );
  }
}