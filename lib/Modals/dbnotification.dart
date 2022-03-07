import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:intl/intl.dart';

int uniqueid() {
  return DateTime.now().millisecondsSinceEpoch.round();
}

Future<void> createNotification() async {
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 1,
          channelKey: 'basic_channel',
          title: "hello baby",
          body: 'welcome to my app',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          notificationLayout: NotificationLayout.Default),
      actionButtons: [
        NotificationActionButton(
            key: "yes", label: "Yes", buttonType: ActionButtonType.KeepOnTop),
        NotificationActionButton(
            key: "no",
            label: "No",
            autoDismissible: false,
            isDangerousOption: true),
      ]);
}

Future<void> scheduleNotification(String dateti) async {
  DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
  DateTime date = dateFormat.parse(dateti); //DateTime.parse(va);
  List<dynamic> scheduledDate = [
    date.add(const Duration(seconds: 25)),
    date.add(const Duration(seconds: 70)),
    date.add(const Duration(seconds: 30))
  ];
  print(DateTime.now());
  print(scheduledDate);
  var i = 0;
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: i,
          channelKey: 'schedule_channel',
          title: "schedule 1",
          body: 'Did you get the DPT Vaccine?',
          wakeUpScreen: true,
          category: NotificationCategory.Reminder,
          payload: {'pay': '1'},
          notificationLayout: NotificationLayout.Default),
      schedule: NotificationCalendar.fromDate(
          date: scheduledDate[i], preciseAlarm: true),
      actionButtons: [
        NotificationActionButton(
            key: 'yes', label: "Yes", buttonType: ActionButtonType.KeepOnTop),
        NotificationActionButton(
            key: "no",
            label: "No",
            
            isDangerousOption: true),
      ]);

   i=i+1;
    await AwesomeNotifications().createNotification(
   content:NotificationContent(
     id:i,
     channelKey: 'schedule_channel',
     title: "schedule 1",
    body: 'Did you get the MMR Vaccine?',
     wakeUpScreen: true,
     category: NotificationCategory.Reminder,
   payload:{'pay':'2'} ,

     notificationLayout: NotificationLayout.Default
     ) ,
     schedule: NotificationCalendar.fromDate(date: scheduledDate[i],preciseAlarm: true),

     actionButtons: [
       NotificationActionButton(key: "yes",label: "Yes",buttonType: ActionButtonType.KeepOnTop),
       NotificationActionButton(key: "no",label: "No",isDangerousOption: true),
   ]
   );
}
