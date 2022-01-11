
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finallygod/Providers/vacination.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class Noti{
  final List<Vaccination> vaccination;
  Noti(this.vaccination);
   final user = FirebaseAuth.instance.currentUser;
Future<void> notifications() async {
  FlutterLocalNotificationsPlugin flutterp = FlutterLocalNotificationsPlugin();
  var va = '2021-07-19 12:40:30';
  print(DateTime.now().toLocal());
  var date = DateTime.now(); //DateTime.parse(va);
  List<dynamic> scheduledDate = [
    date.add(const Duration(seconds: 10)),
    date.add(const Duration(seconds: 15)),
    date.add(const Duration(seconds: 30))
  ];
   fire(int? id, String payload){
     FirebaseFirestore.instance
        .collection('notifications').
       add({
         'id': id,
         'userId': user!.uid,
         'createdAt':DateTime.now(),
         "noti": payload});
   }

  List<String> titless = ["Nameste", "this is the first", "third"];

  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
    'id',
    'name',
    icon: 'ic_launcher',
    enableVibration: true,
    importance: Importance.high,
    priority: Priority.high,
    largeIcon: DrawableResourceAndroidBitmap('ic_launcher'),
  );

  var platformChannelSpecifics = NotificationDetails(
    android: androidPlatformChannelSpecifics,
  );
  String sub="It time to takeshot";
   var i=0;
    await flutterp.zonedSchedule(
    i,
    "Namaste",
    "Thank you for registration",
    tz.TZDateTime.from(scheduledDate[i], tz.local),     //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    payload: "df", uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, 
  );
  fire(null, "welcome");
  i=i+1;
   await flutterp.zonedSchedule(
    i,
    vaccination[i].disease,
    sub,
    tz.TZDateTime.from(scheduledDate[i], tz.local), 
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    payload: "df", uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, 
  );
  fire(1, vaccination[i].disease);
  /*i=i+1;
   await flutterp.zonedSchedule(
    i,
    title[i],
    title[i],
    tz.TZDateTime.from(scheduledDate[i], tz.local), 
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    payload: "df", uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, 
  );
  i=i+1;
   await flutterp.zonedSchedule(
    i,
    title[i],
    title[i],
    tz.TZDateTime.from(scheduledDate[i], tz.local), 
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    payload: "df", uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, 
  );
  i=i+1;
   await flutterp.zonedSchedule(
    i,
    title[i],
    title[i],
    tz.TZDateTime.from(scheduledDate[i], tz.local), 
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    payload: "df", uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, 
  );
  i=i+1;
   await flutterp.zonedSchedule(
    i,
    title[i],
    title[i],
    tz.TZDateTime.from(scheduledDate[i], tz.local), 
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    payload: "df", uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, 
  );i=i+1;
   await flutterp.zonedSchedule(
    i,
    title[i],
    title[i],
    tz.TZDateTime.from(scheduledDate[i], tz.local), 
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    payload: "df", uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime, 
  );*/
}
}