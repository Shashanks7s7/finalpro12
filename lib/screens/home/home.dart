import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:finallygod/Modals/dbnotification.dart';
import 'package:finallygod/Modals/mydatabase.dart';
import 'package:finallygod/Modals/vacination.dart';
import 'package:finallygod/widgets/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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
  initState() {
    super.initState();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('ic_launcher');

    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
    AwesomeNotifications().actionStream.listen((event) {
      if (event.buttonKeyPressed == 'yes') {
        print("mu" + event.payload.toString());
        update(event.payload!['pay'].toString());
        print("ji");
      }
      if (event.buttonKeyPressed == 'no') {
       
        updateistime(event.payload!['pay'].toString());
        print("ji");
      }
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => MyProfile()),
          (route) => route.isFirst);
    });
  }
Future updateistime(String id) async {
    await MyDatabase.instance.updateistimegone(1, int.parse(id));
  }
  Future update(String id) async {
    await MyDatabase.instance.updateisdone(1, int.parse(id));
  }

  Future<String?> onSelectNotification(String? payload) async {
    onNotificationClick(payload!);
  }

  int current = 0;
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
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(user!.photoURL.toString()),
                              radius: 20,
                            ),
                           
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(102, 102, 153, 1),
                              ),
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.deepOrange[300]),
                                    ),
                                  ),
                                  Center(
                                    child: Container(
                                      margin: EdgeInsets.all(3),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  ),
                                  Center(
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed("noti");
                                        },
                                        icon: Icon(Icons.notifications)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 0),
                        child: Container(
                            height: 18,
                            width: 160,
                            child: FittedBox(
                                child: Text(
                                    'Welcome ${user.displayName.toString().trimRight()}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.blueGrey)))),
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10.0, top: 10, bottom: 5, right: 10),
                        width: 175,
                        child: FittedBox(
                          child: Text(
                            "Stay Safe & Healthy",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
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
          child: Icon(
            Icons.add,
            size: 30,
          ),
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
                    icon: Icon(
                      Icons.person,
                      size: 30,
                    )),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () =>
                        Navigator.of(context).pushNamed('settings'),
                    icon: Icon(
                      Icons.settings,
                      size: 30,
                    ))
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
}
