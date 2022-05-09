import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'di/locator.dart';
import 'cubit/app_control/app_control_cubit.dart';
import 'cubit/app_control/app_control_state.dart';
import 'l10n/app_localizations.dart';
import 'page/authorization_page.dart';

class AnimalHostelApp extends StatelessWidget {
  const AnimalHostelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<AppControlCubit>(),
      child: BlocBuilder<AppControlCubit, AppControlState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: state.locale,
            home: AuthorizationPage.create(),
            // home: HomePage(),
          );
        },
      ),
    );
  }
}
