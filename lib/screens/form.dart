import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finallygod/Providers/vacination.dart';
import 'package:finallygod/widgets/ipicker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:intl/intl.dart';

import '../main.dart';
import 'notificationScreen.dart';

class ChildForm extends StatefulWidget {
  final List<Vaccination> vaccination;
  ChildForm(this.vaccination);
  @override
  _ChildFormState createState() => _ChildFormState();
}

class _ChildFormState extends State<ChildForm> {
  @override
  final formkey = GlobalKey<FormState>();
  bool isloading = false;
  String name = '';

  String location = '';

  bool male = false;
  bool female = false;
  var da;
  File? image;
  String id = "";

  void img(File? imm) {
    setState(() {
      image = imm;
    });
  }

  var myFormat = DateFormat('yyyy/MM/d');
  void submit() async {
    final isvalid = formkey.currentState!.validate();

    FocusScope.of(context).unfocus();
    if (!isvalid || image == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please pick an image"),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }
     if (!isvalid || male==female) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Please select single gender"),
        backgroundColor: Theme.of(context).errorColor,
      ));
      return;
    }
    setState(() {
      isloading = true;
    });

    if (isvalid) {
      formkey.currentState!.save();
      try {
        final user = FirebaseAuth.instance.currentUser;
        final userdata = await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();
        final ref = FirebaseStorage.instance
            .ref()
            .child('childimage')
            .child(user.uid)
            .child(DateTime.now().toString() + '.jpg');
        await ref.putFile(image!).whenComplete(() => ref.getDownloadURL().then(
            (value) =>
                FirebaseFirestore.instance.collection('registration').add({
                  'userId': user.uid,
                  'name': name,
                  'address': location,
                  'dob': myFormat.format(da),
                  'male': male,
                  'female': female,
                  'childimage': value,
                }).then((value) {
                  FirebaseFirestore.instance
                      .collection('registration')
                      .doc(value.id)
                      .update({'id': value.id});
                })));
        scheduleAlarm();

        print(myFormat.format(da));
        print(DateTime.now().toIso8601String());
      } catch (error) {
        setState(() {
          isloading = false;
        });
      }

      Navigator.of(context).pop();
    }
  }

  void datep() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2015),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        da = value;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register your child'),
        centerTitle: true,
        // backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
                key: formkey,
                child: Column(children: [
                  ImagePick(img),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Name of child"),
                    keyboardType: TextInputType.name,
                    validator: (val) {
                      if (val == null) {
                        return "Must provide name";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      name = value.toString().trim();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    decoration: InputDecoration(labelText: "Permanent Address"),
                    keyboardType: TextInputType.streetAddress,
                    validator: (value) {
                      if (value == null) {
                        return "must provide address";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      location = value.toString().trim();
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 70,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                       children: [
   ElevatedButton(
     style: ElevatedButton.styleFrom(
elevation: 1,
primary: Colors.grey[400]

         ),
     
                          onPressed: datep,
                          child: Text(
                            "Choose Date of birth",
                            style: Theme.of(context).textTheme.bodyText1,
                          )),
                          
                      Container(
                        width: 150,
                        height: 30,
                        child: FittedBox(
                            child: Text(
                          da == null
                              ? "No Date Choosen"
                              : 'Picked Date: ${myFormat.format(da)}',
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                      ),
                     
                    
                    ]),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Select Gender',style: TextStyle(fontSize: 16),),
                  Row(children: [
                    Text('Male',style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w400
                    ),),
                    Checkbox(
                        value: male,
                        onChanged: (_) {
                          setState(() {
                            male = !male;
                          });
                        }),
                  ]),
                  Row(
                    children: [
                      Text('Female',style: TextStyle(
                      fontSize: 16,fontWeight: FontWeight.w400),),
                      Checkbox(
                          value: female,
                          onChanged: (_) {
                            setState(() {
                              female = !female;
                            });
                          }),
                    ],
                  ),
                  SizedBox(height: 10),
                  isloading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      :GestureDetector(
                        onTap: submit,
                        child: Container(
                          height: 50,
                          width: 250,
                          decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           border: Border.all(width: 1,color: Colors.grey),
                           color: Theme.of(context).primaryColor,
                          ),
                          child: Center(child: Text("Submit",style: Theme.of(context).textTheme.headline2,)),
                          
                          
                        ),
                      )
                ]))),
      ),
    );
  }

  onNotificationClick(String payload) {
    print('Payload $payload');

    Navigator.push(context, MaterialPageRoute(builder: (coontext) {
      return NotificationScreen(
        payload: payload,
      );
    }));
  }

  Future<void> scheduleAlarm() async {
    var va = '2021-07-19 12:40:30';
    print(DateTime.now().toLocal());
    var date = DateTime.now(); //DateTime.parse(va);
    List<dynamic> scheduledDate = [
      date.add(Duration(seconds: 10)),
      //  date.add(Duration(seconds: 10)),
      //  date.add(Duration(seconds: 15))
    ];
    List<String> title = ["Nameste", "this is the second", "third"];

    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'id',
      'name',
      'Channel for Alarm notification',
      icon: 'ic_launcher',
      enableVibration: true,
      importance: Importance.high,
      priority: Priority.high,
      largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );

    // for (int i = 0; i <= 1; i++) {
    await flutterLocalNotificationsPlugin.schedule(0, "Namaste",
        " Your child is registered", scheduledDate[0], platformChannelSpecifics,
        payload: "3",
        androidAllowWhileIdle: true);

    //}
  }
}
