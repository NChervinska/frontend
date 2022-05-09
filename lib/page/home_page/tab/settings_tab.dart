import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/model/employee.dart';
import '../../authorization_page.dart';
import '../../change_password_page.dart';
import '../../register_page.dart';
import '../../../constants/app_style_constants.dart';
import '../../../cubit/app_control/app_control_cubit.dart';
import '../../../l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  final bool admin;
  final Employee? employee;
  const SettingsTab({
    Key? key,
    required this.admin,
    this.employee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: ListView(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<Locale>(
              icon: const Icon(Icons.language),
              items: AppLocalizations.supportedLocales
                  .map((locale) => DropdownMenuItem(
                        value: locale,
                        child: Text(locale.languageCode),
                      ))
                  .toList(),
              onChanged: (locale) {
                if (locale == null) return;
                context.read<AppControlCubit>().updateLocale(locale);
              },
            ),
          ),
          if (!admin)
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: GestureDetector(
                onTap: () =>
                    Navigator.of(context).push(RegisterPage.getRoute(employee)),
                child: Text(
                  AppLocalizations.of(context)!.editProfile,
                  style: AppStyleConstants.languageTile,
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
              onTap: context.read<AppControlCubit>().backup,
              child: Text(
                AppLocalizations.of(context)!.backup,
                style: AppStyleConstants.languageTile,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
              onTap: context.read<AppControlCubit>().restore,
              child: Text(
                AppLocalizations.of(context)!.restore,
                style: AppStyleConstants.languageTile,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                ChangePasswordPage.getRoute(),
              ),
              child: Text(
                AppLocalizations.of(context)!.changePassword,
                style: AppStyleConstants.languageTile,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: GestureDetector(
              onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => AuthorizationPage.create(),
                ),
              ),
              child: Text(
                AppLocalizations.of(context)!.logout,
                style: AppStyleConstants.languageTile,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
