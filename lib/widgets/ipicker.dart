import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
class ImagePick extends StatefulWidget {
 final Function(File image) imgdata;
  ImagePick(this.imgdata);
  

  @override
  _ImagePickState createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
 File? pickedimage;
   void pickimage()async{
    final imagepicker=  ImagePicker();
      final img= await imagepicker.getImage(source: ImageSource.gallery,imageQuality: 60,maxWidth: 150);
      setState(() {
        pickedimage= File(img!.path);
      });
      widget.imgdata(pickedimage!);
   }
 

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        children: [
          CircleAvatar(
            
        
            backgroundColor:Colors.grey[400],
            backgroundImage: pickedimage!=null?FileImage(pickedimage!):null,radius: 30,),
           
           TextButton.icon(onPressed: pickimage, label: Text("Add Image",style: Theme.of(context).textTheme.bodyText1,),icon: FaIcon(FontAwesomeIcons.camera)  ,)
        ],
      ),

      
    );
  }
}