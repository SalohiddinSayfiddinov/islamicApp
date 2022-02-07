import 'package:flutter/material.dart';
import 'package:imtihon/core/alarm.dart';
import 'package:imtihon/routes.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("namozvaqt");
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService().initNotification();
  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) => RouteGenerator.generateRoute(settings),
    );
  }
}
