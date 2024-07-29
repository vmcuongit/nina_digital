import 'package:isar/isar.dart';

part 'settings.g.dart';

@collection
class Settings {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  String? language;
  String? theme;
  bool? onboarding;
}
