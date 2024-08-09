import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'firebase_options.dart';

// Có 3 điều cần lưu ý đối với hàm xử lý background message (hàm _firebaseMessagingBackgroundHandler):
// 1. Không thể là anonymous function
// 2. Phải là top-level function (không phải method của một class)
// 3. Phải có annotation @pragma('vm:entry-point') phía trên function@pragma('vm:entry-point')
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi.setupFlutterNotifications();
  // FirebaseApi.handleMessage(message);
}

class FirebaseApi {
  // Firebase Cloud Messaging (FCM)
  // create instance of Firebase Messaging
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  static late String? fcmToken;

  /// Initialize the [FlutterLocalNotificationsPlugin] package.
  static late FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  /// Create a [AndroidNotificationChannel] for heads up notifications
  static late AndroidNotificationChannel _channel;

  static bool _isFlutterLocalNotificationsInitialized = false;

  Future<void> initNotifications() async {
    // Hiển thị yêu cầu cấp quyền thông báo
    await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // Có 4 giá trị cho authorizationStatus:
    // - authorized: User đã cấp quyền
    // - denied: User từ chối  cấp quyền
    // - notDetermined: User chưa quyết định cấp quyền hay không
    // - provisional: User cấp quyền tạm thời
    // Lưu ý: Đối với Android, mặc định giá trị của authorizationStatus sẽ là authorized nếu user chưa disable notification của ứng dụng.
    // print('Người dùng cấp quyền: ${notificationSettings.authorizationStatus}');

    // Đối với Apple (iOS), đảm bảo APNS token có sẵn trước khi thực hiện bất kỳ lệnh gọi API plugin FCM nào
    if (Platform.isIOS) {
      final apnsToken = await _firebaseMessaging.getAPNSToken();
      if (apnsToken != null) {
        print('APNS Token: $apnsToken');
        // APNS token is available, make FCM plugin API requests...
      }
    }

    // Device Token
    fcmToken = await _firebaseMessaging.getToken();
    print("FCM Token: $fcmToken");

    // Set the background messaging handler early on, as a named top-level function
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> setupFlutterNotifications() async {
    if (_isFlutterLocalNotificationsInitialized) {
      return;
    }
    _channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.max,
    );

    _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    /// Create an Android Notification Channel.
    ///
    /// We use this channel in the `AndroidManifest.xml` file to override the
    /// default FCM channel to enable heads up notifications.
    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    _isFlutterLocalNotificationsInitialized = true;
  }

  static void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;

    if (notification != null && android != null && !kIsWeb) {
      _flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            _channel.id,
            _channel.name,
            channelDescription: _channel.description,
            // TODO add a proper drawable resource to android, for now using
            //      one that already exists in example app.
            icon: 'launch_background',
          ),
        ),
      );
    }
  }

  // Lắng nghe các message trong khi ứng dụng ở trạng thái foreground
  static void setupForegroundMessages() {
    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        FirebaseApi.showFlutterNotification(message);
      },
    );
  }

  // Nhận bất kỳ tin nhắn nào khiến ứng dụng mở từ trạng thái terminated
  static Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      FirebaseApi.showFlutterNotification(initialMessage);
      // handleMessage(initialMessage);
    }

    // Đồng thời xử lý mọi tương tác khi ứng dụng ở chế độ nền thông qua Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  }

  // Đăng ký vào chủ đề khi người dùng đăng nhập
  static Future<void> subscribeToTopic({String topic = 'all_users'}) async {
    if (await FirebaseMessaging.instance.isSupported()) {
      await FirebaseMessaging.instance.subscribeToTopic(topic);
    }
  }

  // Hủy đăng ký khi người dùng đăng xuất (nếu cần)
  static Future<void> unsubscribeFromTopic({String topic = 'all_users'}) async {
    if (await FirebaseMessaging.instance.isSupported()) {
      await FirebaseMessaging.instance.unsubscribeFromTopic(topic);
    }
  }

  // xử lý message nhận được
  static void handleMessage(RemoteMessage message) {
    print('_handleMessage call:');
    print('From: ${message.from}');
    print('data: ${message.data}');
    print('messageId: ${message.messageId}');
    print('messageType: ${message.messageType}');
    print('message notification: ${message.notification?.toMap()}');
  }
}
