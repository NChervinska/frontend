import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/locator.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../cubit/activity_statistic_cubit/activity_statistic_cubit.dart';
import '../cubit/activity_statistic_cubit/activity_statistic_state.dart';
import '../model/chart_data.dart';

class ActivityStatisticPage extends StatelessWidget {
  static PageRoute getRoute(String animalId) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) =>
            locator.get<ActivityStatisticCubit>()..init(animalId),
        child: const ActivityStatisticPage._(),
      ),
    );
  }

  const ActivityStatisticPage._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ActivityStatisticCubit, ActivityStatisticState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: SfCartesianChart(
              primaryXAxis: DateTimeAxis(),
              series: <ChartSeries>[
                AreaSeries<ChartData, DateTime>(
                  dataSource: state.sleepData,
                  xValueMapper: (data, _) => DateTime.parse(data.x),
                  yValueMapper: (data, _) => data.y,
                  color: Colors.green.withOpacity(0.5),
                ),
                AreaSeries<ChartData, DateTime>(
                  dataSource: state.activeData,
                  pointColorMapper: (data, _) => data.color,
                  xValueMapper: (data, _) => DateTime.parse(data.x),
                  yValueMapper: (data, _) => data.y,
                  color: Colors.pink.withOpacity(0.5),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
