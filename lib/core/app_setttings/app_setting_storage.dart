import '../../local_storage/local_storage.dart';
import 'app_setting_provider.dart';
import '../../local_storage/schema/settings.dart';

class AppSettingStorage {
  final _localStorage = LocalStorage.isarDB;

  Future<Settings?> getSetting() async {
    // lây record -> ID: 1
    return await _localStorage.settings.get(1);
  }

  Future<Settings> createSetting() async {
    final newSettings = Settings();
    await _localStorage.writeTxn(() => _localStorage.settings.put(newSettings));
    return newSettings;
  }

  Future<void> updateSetting({required SettingData setting}) async {
    Settings item = _localStorage.settings.getSync(1) ?? Settings();
    final newData = item
      ..theme = setting.theme.toString()
      ..language = setting.language.toString()
      ..onboarding = setting.onboarding;
    await _localStorage.writeTxn(() => _localStorage.settings.put(newData));
  }
}
