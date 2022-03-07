import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finallygod/widgets/ipicker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthCard extends StatefulWidget {
  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  bool islogin = true;

  final formkey = GlobalKey<FormState>();

  String username = '';
  String email = '';

  String password = '';
  bool loading = false;

  File? image;

  void img(File? imm) {
    setState(() {
      image = imm;
    });
  }

  final auth = FirebaseAuth.instance;

  void googlesubmit() async {
    try {
      setState(() {
        loading = true;
      });
      final googlesignin = GoogleSignIn();

      final user = await googlesignin.signIn();

      final googleAuth = await user!.authentication;
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);
      // var userdd=FirebaseAuth.instance.currentUser;
      UserCredential authresult =
          await FirebaseAuth.instance.signInWithCredential(credentials);
      FirebaseFirestore.instance
          .collection('users')
          .doc(authresult.user!.uid)
          .set({
        'username': user.displayName,
        'email': user.email,
        'userimage': user.photoUrl
      });
    } on PlatformException catch (error) {
      var message = 'An Error Occurred';
      if (error.message != null) {
        message = error.message.toString();
      }
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
      setState(() {
        loading = false;
      });
    } catch (error) {
      print(error);
      setState(() {
        loading = false;
      });
    }
  }

  void submit() async {
    UserCredential authResult;
    final isvalid = formkey.currentState!.validate();
    FocusScope.of(context).unfocus();
try {
      if (!islogin) {
        if (!isvalid || image == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Please pick an image"),
            backgroundColor: Theme.of(context).errorColor,
          ));
          return;}}
  setState(() {
        loading = true;  });
      if (isvalid) {
        formkey.currentState!.save();
        if (islogin) {
          authResult = await auth.signInWithEmailAndPassword(
              email: email, password: password);
        } else {
          authResult = await auth.createUserWithEmailAndPassword(
              email: email, password: password);
          final ref = FirebaseStorage.instance
              .ref()
              .child("userimage")
              .child(auth.currentUser!.uid + ".jpg");
          await ref.putFile(image!).whenComplete(() => ref
              .getDownloadURL()
              .then((value) => FirebaseFirestore.instance
                      .collection('users')
                      .doc(authResult.user!.uid)
                      .set({
                    'username': username,
                    'email': email,
                    'userimage': value  })));     
   }} } on PlatformException catch (error) {
      var message = 'An Error Occurred';
      if (error.message != null) {
        message = error.message.toString();}
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(message)));
      setState(() {
        loading = false; });
    } catch (error) {
      print(error);
      setState(() {
        loading = false;
      });}}
    
  

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(20),
        child: Form(
            key: formkey,
            child: Column(children: [
              if (!islogin) ImagePick(img),
              if (!islogin)
                TextFormField(
                  key: ValueKey('username'),
                  decoration: InputDecoration(labelText: "UserName"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "must provide username";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    username = value.toString().trim();
                  },
                ),
              TextFormField(
                key: ValueKey('email'),
                decoration: InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value == null || !value.contains('@')) {
                    return "must provide valid email";
                  }
                  return null;
                },
                onSaved: (value) {
                  email = value.toString().trim();
                },
              ),
              TextFormField(
                key: ValueKey('password'),
                decoration: InputDecoration(labelText: "Password"),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length <= 5) {
                    return " password must be atleast 5 characters";
                  }
                  return null;
                },
                onSaved: (value) {
                  password = value.toString().trim();
                },
              ),
              /*   if(!islogin) TextFormField(
               key: ValueKey('Confirm password'),
               decoration:InputDecoration(
                 
                 labelText: "Confirm Password"),
                 obscureText: true,
                 validator: (value){
                   if(value==null || value!=password){
                     return " password doesnot match";
                   }
                   return null;
                 },
                    

               
             ),*/
              SizedBox(
                height: 10,
              ),
              if (loading)
                Center(
                  child: CircularProgressIndicator(),
                ),
              if (!loading)
                ElevatedButton(
                    onPressed: submit,
                    child: Text(islogin ? "Log In" : "Sign Up")),

              if (!loading)
                OutlinedButton.icon(
                  onPressed: googlesubmit,
                  icon: FaIcon(FontAwesomeIcons.google),
                  label: Text(
                    'Sign In With Google',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              //  TextButton(onPressed: (){}, child: Text("Forget Password",style: TextStyle(color: Colors.black),),),
              Divider(
                thickness: 2,
              ),
              if (!loading)
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        islogin = !islogin;
                      });
                    },
                    child: Text(islogin
                        ? "Create a new account"
                        : "Already have an account?")),
            ])),
      ),
    );
  }
}
