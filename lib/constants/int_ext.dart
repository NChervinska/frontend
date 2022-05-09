import 'package:flutter/material.dart';
import '../l10n/app_localizations.dart';

extension IntExt on int {
  String getString(BuildContext context) {
    final locale = AppLocalizations.of(context)!.localeName;
    if (locale == 'uk') return toString() + ' кілограм';
    return (this * 0.454).toString() + ' pounds';
  }
}
