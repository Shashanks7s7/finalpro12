

import 'package:finallygod/Providers/theme.dart';
import 'package:finallygod/Providers/vacination.dart';
import 'package:finallygod/screens/auth_Screen.dart';
import 'package:finallygod/screens/covid/test.dart';


import 'package:finallygod/screens/form.dart';
import 'package:finallygod/screens/home/settings.dart';
import 'package:finallygod/screens/imunize_details.dart';
import 'package:finallygod/screens/loading.dart';
import 'package:finallygod/screens/map_screen.dart';
import 'package:finallygod/screens/myprofile.dart';
import 'package:finallygod/screens/notificationScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


import 'screens/home/home.dart';

String? selectedNotificationPayload;
void main()async {
   WidgetsFlutterBinding.ensureInitialized();
   /*const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');
 final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
 );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings,
      onSelectNotification: (String? payload) async {
    if (payload != null) {
       
      debugPrint('notification payload: $payload');

    }
   selectedNotificationPayload=payload;

  
  });*/
  
  await Firebase.initializeApp();
 
  runApp(MyApp());
}







 final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void initState() {
    currenttheme.addListener(() {
      setState(() {
        
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  
  Widget build(BuildContext context) {
 
     
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vaccination',color: Theme.of(context).colorScheme.background,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currenttheme.currentTheme,
      home: StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),
         builder: (context,snapshotdata)=> snapshotdata.hasData? Home(vacdetails):AuthScreen()
      ),
      
      routes: {
      'form':(context)=>ChildForm(vacdetails),
      'immunedetail':(context)=>ImmuneDetails(vacdetails ),
      'myprofile':(context)=> MyProfile(),
      'noti':(context)=>NotificationScreen(payload: selectedNotificationPayload),
      'covid':(context)=> Test(),  //CovidScreen(),
      'map':(context)=>MapScreen(),
      'settings':(context)=> Settings(),
      'loading':(context)=>Loading()
      //'coronadetails':(context)=>CoronaDetails(),
      },
    );
  }
}

