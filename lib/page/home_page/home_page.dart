import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/cubit/app_control/app_control_cubit.dart';
import 'package:frontend/cubit/app_control/app_control_state.dart';
import 'package:frontend/page/home_page/tab/settings_tab.dart';
import 'tab/client_tab.dart';
import 'tab/user_tab.dart';
import 'tab/animal_tab.dart';
import 'tab/employee_tab.dart';
import '../../l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppControlCubit, AppControlState>(
        builder: (context, state) {
      return DefaultTabController(
        length: state.isAdmin ? 5 : 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: AppLocalizations.of(context)!.animals),
                if (state.isAdmin)
                  Tab(text: AppLocalizations.of(context)!.employees),
                if (state.isAdmin)
                  Tab(text: AppLocalizations.of(context)!.users),
                if (state.isAdmin)
                  Tab(text: AppLocalizations.of(context)!.clients),
                const Tab(icon: Icon(Icons.settings)),
              ],
            ),
            title: Text(AppLocalizations.of(context)!.appName),
          ),
          body: TabBarView(
            children: [
              AnimalTab(admin: state.isAdmin),
              if (state.isAdmin) const EmployeeTab(),
              if (state.isAdmin) const UserTab(),
              if (state.isAdmin) const ClientTab(),
              SettingsTab(admin: state.isAdmin, employee: state.employee),
            ],
          ),
        ),
      );
    });
  }
}
