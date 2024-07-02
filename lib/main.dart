
// import 'package:expensetracker/presentation/Expense/Model/ExpenseModel.dart';
// import 'package:expensetracker/presentation/Tabbar/Binding/initialbinding.dart';
// import 'package:expensetracker/routes/App_Routes.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// String? fcm_token;
// const String userHiveBox="User Box"; 
// Future<void> main()async {

//     WidgetsFlutterBinding.ensureInitialized();
//       await Hive.initFlutter(); 
  
//   // To open the user hive box 
//   await Hive.openBox(userHiveBox); 
//    await Firebase.initializeApp(options: FirebaseOptions(
//               apiKey: 'AIzaSyBkN3dMTU9T4j9GMU8HBkXQcE8541lse_g',
//               appId: '1:505125381180:android:ac201978d62ef721f2cf39',
//               messagingSenderId: '505125381180',
//               projectId: 'pocketbook-a2bda',
            
//             ),);
//     FirebaseMessaging messaging = await FirebaseMessaging.instance;

//     fcm_token = await messaging.getToken();
    
//     print(fcm_token);
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       locale: Get.deviceLocale,
//       fallbackLocale: Locale("en","US"),
//       title: "PocketBook",
//                initialBinding: InitialBindings(),
//       initialRoute: AppRoutes.SplashScreen,
//       getPages: AppRoutes.pages
//     );
//   }
// }



import 'package:expensetracker/presentation/Expense/Model/ExpenseModel.dart';
import 'package:expensetracker/presentation/Tabbar/Binding/initialbinding.dart';
import 'package:expensetracker/routes/App_Routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:permission_handler/permission_handler.dart';
String? fcm_token;
const String userHiveBox = "User Box";
FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  
  // To open the user hive box 
  await Hive.openBox(userHiveBox); 
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyBkN3dMTU9T4j9GMU8HBkXQcE8541lse_g',
      appId: '1:505125381180:android:ac201978d62ef721f2cf39',
      messagingSenderId: '505125381180',
      projectId: 'pocketbook-a2bda',
    ),
  );

  FirebaseMessaging messaging = await FirebaseMessaging.instance;
  fcm_token = await messaging.getToken();
  print(fcm_token);

  // Initialize the local notifications plugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  // Initialize the timezone package
  tzdata.initializeTimeZones();
  tz.setLocalLocation(tz.getLocation('Asia/Kolkata')); // Example: 'Europe/London'
  // Schedule the daily notification
  _requestPermissions();
  scheduleImmediateNotification();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: Locale("en", "US"),
      title: "PocketBook",
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.SplashScreen,
      getPages: AppRoutes.pages,
    );
  }
}
void scheduleImmediateNotification() async {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'daily_reminder_channel',
    'Daily Reminder',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: false,
  );

  const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  // Schedule notification 5 seconds from now (for testing)
  final tz.TZDateTime scheduledDate =
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5));

  await flutterLocalNotificationsPlugin.zonedSchedule(
    0,
    'Immediate Reminder',
    'This is an immediate test notification.',
    scheduledDate,
    platformChannelSpecifics,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );
}

Future<void> _requestPermissions() async {
  // Request notification permissions
  if (!(await Permission.notification.isGranted)) {
    await Permission.notification.request();
  }

  // Optionally, request other permissions your app may need
  // Example: Location permission
  if (!(await Permission.location.isGranted)) {
    await Permission.location.request();
  }
}