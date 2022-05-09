import 'package:flutter/material.dart';
import 'package:frontend/l10n/app_localizations.dart';

enum TypeEnum {
  cat,
  dog,
  parrot,
  humster,
  turtle,
}

extension TypeExt on TypeEnum {
  static TypeEnum fromJson(String json) {
    return TypeEnum.values.firstWhere((element) => element.name == json);
  }

  static String toJson(TypeEnum type) {
    return type.name;
  }

  String getLabel(BuildContext context) {
    switch (this) {
      case TypeEnum.cat:
        return AppLocalizations.of(context)!.cat;
      case TypeEnum.dog:
        return AppLocalizations.of(context)!.dog;
      case TypeEnum.humster:
        return AppLocalizations.of(context)!.humster;
      case TypeEnum.parrot:
        return AppLocalizations.of(context)!.parrot;
      case TypeEnum.turtle:
        return AppLocalizations.of(context)!.turtle;
    }
  }
}
