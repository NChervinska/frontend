import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/cubit/activity_cubit/activity_cubit.dart';
import 'package:frontend/cubit/activity_cubit/activity_state.dart';
import 'package:frontend/di/locator.dart';
import 'package:frontend/page/alter_activity_page.dart';

import 'view/activity_tile.dart';

class ActivityPage extends StatelessWidget {
  final String animalId;
  const ActivityPage({Key? key, required this.animalId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<ActivityCubit>(param1: animalId)..init(),
      child: BlocBuilder<ActivityCubit, ActivityState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ActivityTile(
                      activity: state.activities[index],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: state.activities.length,
              ),
            ),
            floatingActionButton: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () async {
                await Navigator.of(context).push(
                  AlterActivityPage.getRoute(animalId),
                );
                context.read<ActivityCubit>().init();
              },
            ),
          );
        },
      ),
    );
  }
}
