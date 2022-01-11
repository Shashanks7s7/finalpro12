
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Draw extends StatelessWidget {
  Draw({ Key? key }) : super(key: key);
  
 /*void getdata()async{
  FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
  
  }*/
  void signout()async{
    FirebaseAuth.instance.signOut();
final googlesignin= GoogleSignIn();
            await googlesignin.disconnect();
            
  }


  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Drawer(
      
      child:Column(
        
        children: [
          AppBar(
            //backgroundColor:Theme.of(context).colorScheme.primary,
          
            title: Text("Menu"),
            
             automaticallyImplyLeading: true,
             
             actions: [
               IconButton(onPressed: (){
                 Navigator.of(context).pop();
               }, icon: FaIcon(FontAwesomeIcons.arrowLeft))
             ],
          ),
          
          
         ListTile(title: Text('My Profile'),leading: FaIcon(FontAwesomeIcons.user), onTap: (){Navigator.of(context).pushNamed('myprofile');},  ),
         SizedBox(height: 400,),
          ListTile(title: Text("LogOut"),leading: FaIcon(FontAwesomeIcons.signOutAlt),onTap: signout,)
          
        ],
      )
      
    );
  }
}