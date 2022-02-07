import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  AndroidInitializationSettings? initializationSettingsAndroid;
  IOSInitializationSettings? initializationSettingsIOS;
  InitializationSettings? initializationSettings;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  int? day = DateTime.now().day, hour, minute;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    initializationSettingsAndroid =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, subtitle, content) {});
    initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(
      initializationSettings!,
      onSelectNotification: (v) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (c) => Scaffold(
              appBar: AppBar(),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime(2025),
          ).then((value) async {
            day = value!.day;
            await showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            ).then((value) {
              hour = value!.hour;
              minute = value.minute;
            });
            b(day!, hour!, minute!);
          });
          // b();
          // FlutterAlarmClock.createAlarm(20, 00);
        },
        child: const Icon(Icons.send),
      ),
    );
  }

  a(int day, int hour, int minute) async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        "Eslatma",
        "hello",
        tz.TZDateTime.from(
          DateTime(2022, 2, day, hour, minute),
          tz.getLocation('America/Detroit'),
        ),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "channelId",
            "channelName",
            channelDescription: "channel deskription",
            importance: Importance.max,
          ),
          iOS: IOSNotificationDetails(),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }

  b(int day, int hour, int minute) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails("channelId", "channelName",
            channelDescription: "your channel description",
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        "Eslatma",
        "hello",
        tz.TZDateTime.from(
          DateTime(2022, 2, day, hour, minute),
          tz.getLocation('America/Detroit'),
        ),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            "channelId",
            "channelName",
            channelDescription: "channel deskription",
            importance: Importance.max,
          ),
          iOS: IOSNotificationDetails(),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true);
  }
}