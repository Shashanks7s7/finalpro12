import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finallygod/Providers/theme.dart';
import 'package:finallygod/Providers/vacination.dart';
import 'package:finallygod/widgets/drawer.dart';
import 'package:finallygod/widgets/home_tabview.dart';
import 'package:finallygod/widgets/notice_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:finallygod/widgets/home/cus_clipper.dart';

import '../imunize_details.dart';
import '../myprofile.dart';
import 'clickable.dart';
import 'bargraph_view.dart';
import '/../main.dart';
import '../notificationScreen.dart';

class Home extends StatefulWidget {
  final List<Vaccination> vaccination;
 Home(this.vaccination);
  

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  initState(){
    super.initState();

    var initializationSettingsAndroid =
    AndroidInitializationSettings('ic_launcher');
    
    var initializationSettings = InitializationSettings(
       android: initializationSettingsAndroid);
  flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }
   Future<String?> onSelectNotification(String? payload) async {
    onNotificationClick(payload!);

}
int current=0;
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
        fontFamily: "Lato",
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black);
        final user = FirebaseAuth.instance.currentUser;


    return Scaffold(
drawer: Draw(),
        body: SafeArea(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Stack(
                children: [
               
                 
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(user!.photoURL.toString()),radius: 20,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color.fromRGBO( 102, 102, 153, 1),                 
                  ),
                  child: Stack(
                    children: [
                     Center(
                       child: Container(
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: Colors.deepOrange[300]
                         ),
                       ),
                     ),
                     Center(
                       child: Container(
                         margin: EdgeInsets.all(3),
                         decoration: BoxDecoration(
                           shape: BoxShape.circle,
                           color: Theme.of(context).primaryColor
                         ),
                    
                       ),
                          
                     ),
                     Center(
                       child:   IconButton(onPressed: () { 
Navigator.of(context).pushNamed("noti");

                       }, icon: Icon(Icons.notifications)),
                     )
                    ],
                  ),
                ),
              
              ],
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
            child: Container(
              height: 18,
              width: 160,
              child: FittedBox(child: Text('Welcome ${user.displayName!.trimRight()}', style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.blueGrey)))),
          ),
      
         Container(
            padding: const EdgeInsets.only(left: 10.0, top: 10,bottom: 5,right: 10),
            width: 175,
            child: FittedBox(
           
                child: Text(
                  "Stay Safe & Healthy",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              
            ),
          ),
                    ],
                  )
                ],
              ),
              Clickable(),
              SizedBox(
                height: 2,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GRAPH",
                      style: textStyle,
                    ),
                    Row(
                      children: [
                        Text(
                          "Vaccine ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("vs"),
                        Text(
                          " Weeks After Birth",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  ],
                ),
              ),
              List_View(),
            ]),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,size: 30,),
          backgroundColor: Theme.of(context).primaryColor,
             
          onPressed: () {
            Navigator.of(context).pushNamed('form');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
            elevation: 20,
            shape: CircularNotchedRectangle(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              
                IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyProfile()));
                    },
                    icon: Icon(Icons.person,size: 30,)
                    
                    ),
                SizedBox(
                  width: 20,
                ),
              
                IconButton(onPressed: () =>Navigator.of(context).pushNamed('settings'), icon: Icon(Icons.settings,size: 30,))
              ],
            )));
    
   
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
    var date = DateTime.now();          //DateTime.parse(va);
    List<dynamic> scheduledDate = [
  
      date.add(Duration(seconds: 5)),
      date.add(Duration(seconds: 10)),
      date.add(Duration(seconds: 15))
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

    for (int i = 0; i <= 2; i++) {
      await flutterLocalNotificationsPlugin.schedule(
          i, "Its time to get ${widget.vaccination[i].vaccine}", "Against for ${widget.vaccination[i].disease}", scheduledDate[i], platformChannelSpecifics,payload: widget.vaccination[i].vaccine,
          androidAllowWhileIdle: true
          
          );
    
          
    }
    
  }
  
}
