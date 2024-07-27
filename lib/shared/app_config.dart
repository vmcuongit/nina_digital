import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/app_setttings/app_setting_provider.dart';
import '../features/home/home_screen.dart';
import '../features/onboarding/onboarding_screen.dart';

class AppConfig {
  // Thông tin App
  static String appTitle = 'VMC CORE';
  static String appPackageName = 'com.vmc.core';
  static String appVersion = '1.0.1';

  // Secret Key kết nối API
  static const String secretKey = 'nina-digital-key';

  // Thông tin thiết bị
  static late final Map<String, dynamic>? deviceInfo;

  // Ngôn ngữ và Theme mặc định của App
  static const String languageDefault = 'vi';
  static ThemeMode themeModeDefault = ThemeMode.light;

  // Debug: Hiển thị tất cả các Routes của App  =>  tắt thì set về false
  static bool debugLogDiagnostics = true;

  // Nếu App này hoạt động offline thì set => true
  static bool offlineApp = false;

  // App bắt buộc phải đăng nhập ?
  static bool mustLogin = false;

  // App có màn hình onboarding không ?  =>  không thì để trống
  static const String pathOnboarding = OnboardingScreen.pathRoute;

  // Màn hình đầu tiên khi App được bật
  static String initialPath = HomeScreen.pathRoute;

  _loadDeviceInfo() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;
    return deviceInfo.data;
  }

  // Load dữ liệu hoặc khởi tạo các dự liệu cần thiết để App hoạt động
  initApp(Ref ref) async {
    // lấy thông tin thiết bị
    deviceInfo = await _loadDeviceInfo();

    // Load cấu hình App
    await ref.read(appSettingProvider.notifier).init();

    // hiển thị Splash ít nhất 1 giây (khi quá trình khởi tạo diễn ra nhanh)
    await Future.delayed(const Duration(seconds: 1));
  }
}
