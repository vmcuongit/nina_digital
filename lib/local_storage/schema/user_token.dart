import 'package:isar/isar.dart';

part 'user_token.g.dart';

@collection
class UserToken {
  Id id = Isar.autoIncrement; // you can also use id = null to auto increment
  String? accessToken;
  String? refreshToken;
}
