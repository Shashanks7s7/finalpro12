import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:finallygod/Modals/theme.dart';
import 'package:finallygod/Modals/vacination.dart';
import 'package:finallygod/screens/auth_Screen.dart';

import 'package:finallygod/screens/form.dart';
import 'package:finallygod/screens/home/settings.dart';
import 'package:finallygod/screens/imunize_details.dart';
import 'package:finallygod/screens/loading.dart';
import 'package:finallygod/screens/map_screen.dart';
import 'package:finallygod/screens/message/messagescreen.dart';
import 'package:finallygod/screens/myprofile.dart';
import 'package:finallygod/screens/notificationScreen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'screens/home/home.dart';
import 'package:timezone/data/latest_all.dart' as tz;

String? selectedNotificationPayload;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  AwesomeNotifications().initialize('resource://drawable/ic_launcher', [
    NotificationChannel(
        channelName: 'Basic_Notifications',
        channelKey: 'basic_channel',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'dec',
        locked: true),
    NotificationChannel(
        channelName: 'Scheduled_Notifications',
        channelKey: 'schedule_channel',
        defaultColor: Colors.teal,
        importance: NotificationImportance.High,
        channelShowBadge: true,
        channelDescription: 'shedule',
        locked: true,
        enableLights: true,
        enableVibration: true)
  ]);
  await Firebase.initializeApp();

  runApp(MyApp());
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    currenttheme.addListener(() {
      setState(() {});
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vaccination',
      color: Theme.of(context).colorScheme.background,
      theme: CustomTheme.lightTheme,
      darkTheme: CustomTheme.darkTheme,
      themeMode: currenttheme.currentTheme,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshotdata) =>
            snapshotdata.hasData ? Home(vacdetails) : AuthScreen(),
      ),
      routes: {
        'form': (context) => ChildForm(vacdetails),
        'immunedetail': (context) => ImmuneDetails(vacdetails),
        'myprofile': (context) => MyProfile(),
        'noti': (context) =>
            NotificationScreen(payload: selectedNotificationPayload),
        'chat': (context) => ChatScreen(), //CovidScreen(),
        'map': (context) => MapScreen(),
        'settings': (context) => Settings(),
        'loading': (context) => Loading()
        //'coronadetails':(context)=>CoronaDetails(),
      },
    );
  }
}
