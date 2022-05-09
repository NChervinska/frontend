import 'package:flutter/material.dart';
import 'package:frontend/constants/int_ext.dart';
import 'package:frontend/model/type.dart';
import '../../../constants/app_style_constants.dart';
import '../../../l10n/app_localizations.dart';
import '../../../model/animal.dart';
import '../../animal_page.dart';

class AnimalTile extends StatelessWidget {
  final Animal animal;

  const AnimalTile({
    Key? key,
    required this.animal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(AnimalPage.getRoute(animal.id)),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: Colors.blue),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              animal.name,
              style: AppStyleConstants.languageTile,
            ),
            const SizedBox(height: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                    '${AppLocalizations.of(context)!.type}: ${animal.type.getLabel(context)}'),
                Text('${AppLocalizations.of(context)!.age}: ${animal.age}'),
                Text(
                    '${AppLocalizations.of(context)!.weight}: ${animal.weight.getString(context)}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
