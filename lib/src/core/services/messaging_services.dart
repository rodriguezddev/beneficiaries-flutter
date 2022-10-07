import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../constants/key_constants.dart';

class MessagingServices {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  /// Initialize all the listeners and permissions request
  Future<void> initFCM() async {
    await _requestPermissions();

    AndroidNotificationDetails? androidNotificationDetails;
    IOSNotificationDetails? iosNotificationDetails; 

    if (!kIsWeb) {
      if (Platform.isAndroid) {
        final channel = await _createNotificationChannel();
        androidNotificationDetails = AndroidNotificationDetails(
          channel.id, channel.name,
          icon: KeyConstants.iconKey);
      } else if (Platform.isIOS) {
        iosNotificationDetails =  const IOSNotificationDetails();
      }
    }

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) async {
        RemoteNotification? notification = message.notification;
        if (notification == null) {
          return;
        }

        NotificationDetails? notificationDetails;

        if (!kIsWeb) {
          if (Platform.isAndroid) {
            notificationDetails = NotificationDetails(
              android: androidNotificationDetails!,
            );
          } else if (Platform.isIOS) {
            notificationDetails = NotificationDetails(
              iOS: iosNotificationDetails
            );
          }
        }

        await showLocalNotification(
          id: notification.hashCode,
          title: notification.title,
          body: notification.body,
          notificationDetails: notificationDetails,
        );
      },
    );
  }

  Future<void> showLocalNotification({
    required int id,
    String? title,
    String? body,
    NotificationDetails? notificationDetails,
  }) async {
    await _flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }

  Future<AndroidNotificationChannel> _createNotificationChannel() async {
    const notificationChannel = AndroidNotificationChannel(
      KeyConstants.idChannelKey,
      KeyConstants.titleChannelKey,
      importance: Importance.max,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(notificationChannel);
    return notificationChannel;
  }

  Future<String?> getToken() async {
    return await _messaging.getToken();
  }

  Future<void> _requestPermissions() async =>
    await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
}
