import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/animal_statistic_cubit/animal_statistic_state.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../cubit/animal_statistic_cubit/animal_statistic_cubit.dart';
import '../di/locator.dart';
import '../model/chart_data.dart';
import '../model/type.dart';

class AnimalStatisticPage extends StatelessWidget {
  final bool admin;
  const AnimalStatisticPage._({Key? key, required this.admin})
      : super(key: key);

  static PageRoute getRoute(bool admin) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => locator.get<AnimalStatisticCubit>()..init(admin),
        child: AnimalStatisticPage._(admin: admin),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnimalStatisticCubit, AnimalStatisticState>(
      builder: (context, state) {
        if (state.breedData.isEmpty) return const SizedBox.shrink();

        return Scaffold(
          appBar: AppBar(),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SfCircularChart(
                series: <CircularSeries>[
                  PieSeries<ChartData, String>(
                    dataSource: state.breedData,
                    dataLabelSettings: const DataLabelSettings(isVisible: true),
                    pointColorMapper: (data, _) => data.color,
                    dataLabelMapper: (data, _) {
                      if (data.y == 0) return '';
                      return TypeExt.fromJson(data.x).getLabel(context);
                    },
                    xValueMapper: (data, _) => data.x,
                    yValueMapper: (data, _) => data.y,
                    explode: true,
                    explodeAll: true,
                  )
                ],
              ),
              if (admin)
                SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  series: <ChartSeries>[
                    LineSeries<ChartData, String>(
                      dataSource: state.userStatistic,
                      xValueMapper: (ChartData data, _) => data.x,
                      yValueMapper: (ChartData data, _) => data.y,
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
