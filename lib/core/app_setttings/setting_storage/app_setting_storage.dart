import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../app_setting_provider.dart';
import 'settings.dart';

class AppSettingStorage {
  late Isar isar;

  Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [SettingsSchema],
      directory: dir.path,
      inspector: true,
    );
  }

  Future<Settings?> getSetting() async {
    // lây record -> ID: 1
    return await isar.settings.get(1);
  }

  Future<Settings> createSetting() async {
    final newSettings = Settings();
    await isar.writeTxn(() => isar.settings.put(newSettings));
    return newSettings;
  }

  Future<void> updateSetting({required SettingData setting}) async {
    Settings item = isar.settings.getSync(1) ?? Settings();
    final newData = item
      ..theme = setting.theme.toString()
      ..language = setting.language.toString()
      ..onboarding = setting.onboarding;
    await isar.writeTxn(() => isar.settings.put(newData));
  }
}
