import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/page/user_page.dart';
import '../../../constants/constant_string.dart';
import '../../../cubit/client_cubit/client_cubit.dart';
import '../../../cubit/client_cubit/client_state.dart';
import '../../../di/locator.dart';
import '../view/client_tile.dart';

class ClientTab extends StatelessWidget {
  const ClientTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => locator.get<ClientCubit>()..init(),
        child: BlocBuilder<ClientCubit, ClientState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(UserPage.getRoute(
                        role: ConstantString.client,
                        userId: state.clients[index].userId,
                      )),
                      child: ClientTile(
                        client: state.clients[index],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: state.clients.length,
              ),
            );
          },
        ),
      ),
    );
  }
}
