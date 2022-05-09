import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/constant_string.dart';
import '../../../cubit/user_cubit/user_cubit.dart';
import '../../../cubit/user_cubit/user_state.dart';
import '../../../di/locator.dart';
import '../../user_page.dart';
import '../view/user_tile.dart';

class UserTab extends StatelessWidget {
  const UserTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => locator.get<UserCubit>()..init(),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        final role = state.users[index].role;
                        if (role == ConstantString.admin) return;
                        Navigator.of(context).push(UserPage.getRoute(
                          role: role,
                          userId: state.users[index].id,
                        ));
                      },
                      child: UserTile(
                        user: state.users[index],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: state.users.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
