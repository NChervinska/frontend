import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/constant_string.dart';
import '../cubit/user_page_cubit/user_page_cubit.dart';
import '../cubit/user_page_cubit/user_page_state.dart';
import '../../constants/app_style_constants.dart';
import '../di/locator.dart';
import '../l10n/app_localizations.dart';

class UserPage extends StatelessWidget {
  static PageRoute getRoute({
    required String role,
    required String userId,
  }) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: ((context) =>
              locator.get<UserPageCubit>()..init(userId, role)),
          child: const UserPage._(),
        );
      },
    );
  }

  const UserPage._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserPageCubit, UserPageState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${AppLocalizations.of(context)!.name}: ${state.client?.name ?? state.employee?.name}',
                style: AppStyleConstants.languageTile,
              ),
              Text(
                '${AppLocalizations.of(context)!.surname}: ${state.client?.surname ?? state.employee?.surname}',
                style: AppStyleConstants.languageTile,
              ),
              Text(
                '${AppLocalizations.of(context)!.phone}: ${state.client?.phone ?? state.employee?.phone}',
                style: AppStyleConstants.languageTile,
              ),
              if (state.role != ConstantString.employee)
                Text(
                  '${AppLocalizations.of(context)!.bonus}: ${state.client?.bonus}',
                  style: AppStyleConstants.languageTile,
                ),
            ],
          ),
        );
      },
    );
  }
}
