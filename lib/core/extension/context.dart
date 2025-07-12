import 'package:mubasher_app/config/lang/app_localizations.dart';
import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  AppLocalizations get lang => AppLocalizations.of(this)!;
  bool get isArabic => Localizations.localeOf(this).languageCode == 'ar';
}
