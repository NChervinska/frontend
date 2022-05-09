import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../animal_statistic_page.dart';
import '../../../cubit/animal_cubit/animal_cubit.dart';
import '../../../cubit/animal_cubit/animal_state.dart';
import '../../../di/locator.dart';
import '../view/animal_tile.dart';

class AnimalTab extends StatelessWidget {
  final bool admin;
  const AnimalTab({Key? key, required this.admin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator.get<AnimalCubit>()..init(admin),
      child: BlocBuilder<AnimalCubit, AnimalState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              actions: [
                IconButton(
                  onPressed: () => Navigator.of(context).push(
                    AnimalStatisticPage.getRoute(admin),
                  ),
                  icon: const Icon(
                    Icons.stacked_bar_chart,
                    color: Colors.blue,
                  ),
                )
              ],
              backgroundColor: Colors.white,
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(),
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimalTile(animal: state.animals[index]),
                  );
                },
                itemCount: state.animals.length,
              ),
            ),
          );
        },
      ),
    );
  }
}
