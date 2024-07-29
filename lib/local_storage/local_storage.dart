import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart'
    show getApplicationDocumentsDirectory;

import 'schema/settings.dart';
import 'schema/user_token.dart';

class LocalStorage {
  static late final Isar isarDB;

  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    isarDB = await Isar.open(
      [SettingsSchema, UserTokenSchema],
      directory: dir.path,
      inspector: true,
    );
  }
}
