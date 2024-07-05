import 'package:flutter/cupertino.dart';

import 'app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get translate => AppLocalizations.of(this);
}
