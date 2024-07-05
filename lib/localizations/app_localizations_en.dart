import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'App Name';

  @override
  String get no_internet => 'You have lost Internet connection. Please wait until the internet is stable again.';

  @override
  String get error404 => 'You just landed on a screen that doesn\'t exist.';

  @override
  String get wait => 'Please wait';

  @override
  String get home => 'Home page';
}
