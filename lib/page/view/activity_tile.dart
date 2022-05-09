import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants/app_style_constants.dart';
import '../../cubit/activity_cubit/activity_cubit.dart';
import '../../l10n/app_localizations.dart';
import '../../model/activity.dart';
import '../alter_activity_page.dart';

class ActivityTile extends StatelessWidget {
  final Activity activity;

  const ActivityTile({Key? key, required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Colors.blue),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            activity.animal?.name ?? '',
            style: AppStyleConstants.languageTile,
          ),
          const Icon(Icons.brightness_high_outlined, size: 40),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${AppLocalizations.of(context)!.activeHours}: ${activity.activeHour}',
              ),
              Text(
                '${AppLocalizations.of(context)!.sleepHours}: ${activity.sleepHour}',
              ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () async {
              await Navigator.of(context).push(
                AlterActivityPage.getRoute(activity.animalId ?? '', activity),
              );
              context.read<ActivityCubit>().init();
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => context.read<ActivityCubit>().delete(activity.id),
          )
        ],
      ),
    );
  }
}
