import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';

class Dialogs {
  Dialogs.of(this.context);

  final BuildContext context;

  showErrorDialog(String errorMessage) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return WillPopScope(
          onWillPop: () async => true,
          child: AlertDialog(
            title: Text(AppLocalizations.of(context)!.error),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text(errorMessage),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
