import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../shared/app_config.dart';
import 'app_setting_storage.dart';

part 'app_setting_provider.g.dart';

class SettingData {
  final String? language;
  final String? theme;
  final bool? onboarding;

  SettingData({this.language, this.theme, this.onboarding});

  SettingData copyWith({String? language, String? theme, bool? onboarding}) {
    return SettingData(
      language: language ?? this.language,
      theme: theme ?? this.theme,
      onboarding: onboarding ?? this.onboarding,
    );
  }
}

@Riverpod(keepAlive: true)
class AppSetting extends _$AppSetting {
  final AppSettingStorage _appSettingStorage = AppSettingStorage();

  @override
  SettingData build() {
    // Cấu hình mặc định khi mở app
    return SettingData(
      language: AppConfig.languageDefault,
      theme: (AppConfig.themeModeDefault == ThemeMode.light) ? 'light' : 'dark',
      onboarding: false,
    );
  }

  Future<void> init() async {
    final setting = await _appSettingStorage.getSetting();
    if (setting != null) {
      // Lấy cấu hình đã lưu trước đó
      state = state.copyWith(
        language: setting.language,
        theme: setting.theme,
        onboarding: setting.onboarding,
      );
    }
    updateStorage();
  }

  ThemeMode getThemeMode() {
    ThemeMode themeMode;
    switch (state.theme.toString()) {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      case 'system':
        themeMode = ThemeMode.system;
        break;
      default:
        themeMode = ThemeMode.light;
        break;
    }
    return themeMode;
  }

  Future<void> changeTheme({required String theme}) async {
    state = state.copyWith(theme: theme);
    updateStorage();
  }

  Future<void> changeLanguage({required String language}) async {
    state = state.copyWith(language: language);
    updateStorage();
  }

  Future<void> setOnboardingLoaded() async {
    state = state.copyWith(onboarding: true);
    updateStorage();
  }

  Future<void> updateStorage() async {
    await _appSettingStorage.updateSetting(setting: state);
  }
}
