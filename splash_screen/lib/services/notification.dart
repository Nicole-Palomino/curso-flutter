import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async {
  AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('app_icon');

  DarwinInitializationSettings darwinInitializationSettingsiOS = DarwinInitializationSettings();

  InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: darwinInitializationSettingsiOS
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}

Future<void> mostrarNotificacion() async {
  AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
    importance: Importance.max,
    priority: Priority.high,
    'your_channel_id',
    'your_channel_name',
  );

  // DarwinNotificationDetails darwinNotificationDetails = DarwinNotificationDetails();

  NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails
  );

  await flutterLocalNotificationsPlugin.show(1, "Titulo de notificacion", "Esta es una notificacion de prueba", notificationDetails);
}