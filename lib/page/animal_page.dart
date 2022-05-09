import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/constants/int_ext.dart';
import 'package:frontend/page/activity_statistic_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'activity_page.dart';
import '../cubit/animal_page_cubit/animal_page_cubit.dart';
import '../cubit/animal_page_cubit/animal_page_state.dart';
import '../di/locator.dart';
import '../model/type.dart';
import '../../constants/app_style_constants.dart';
import '../l10n/app_localizations.dart';

class AnimalPage extends StatelessWidget {
  static PageRoute getRoute(String id) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => locator.get<AnimalPageCubit>()..init(id),
        child: const AnimalPage._(),
      ),
    );
  }

  const AnimalPage._({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AnimalPageCubit, AnimalPageState>(
        builder: (context, state) {
          if (state.status != AnimalPageStatus.success) {
            return const SizedBox.shrink();
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                state.animal?.name ?? '',
                style: AppStyleConstants.languageTile,
              ),
              const Icon(Icons.pets, size: 60),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '${AppLocalizations.of(context)!.type}: ${state.animal?.type.getLabel(context) ?? ''}',
                    style: AppStyleConstants.languageTile,
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.age}: ${state.animal?.age}',
                    style: AppStyleConstants.languageTile,
                  ),
                  Text(
                    '${AppLocalizations.of(context)!.weight}: ${state.animal?.weight.getString(context)}',
                    style: AppStyleConstants.languageTile,
                  ),
                ],
              ),
              _buildButtons(context, state),
            ],
          );
        },
      ),
    );
  }

  Widget _buildButtons(BuildContext context, AnimalPageState state) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          icon: const Icon(Icons.dining, size: 40),
          onPressed: () async => await launchUrl(
            Uri.parse(state.feed),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.recommend, size: 40),
          onPressed: () async => await launchUrl(
            Uri.parse(state.recommendation),
          ),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).push(
            ActivityStatisticPage.getRoute(state.animal?.id ?? ''),
          ),
          icon: const Icon(Icons.stacked_bar_chart, size: 40),
        ),
        IconButton(
          onPressed: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ActivityPage(
                animalId: state.animal?.id ?? '',
              ),
            ),
          ),
          icon: const Icon(Icons.bedroom_baby, size: 40),
        ),
      ],
    );
  }
}
