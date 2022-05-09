import 'package:flutter/material.dart';
import '../../../constants/app_style_constants.dart';
import '../../../model/client.dart';

class ClientTile extends StatelessWidget {
  final Client client;

  const ClientTile({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: Theme.of(context).cardColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${client.name} ${client.surname}',
            style: AppStyleConstants.languageTile,
          ),
          const Icon(Icons.person, size: 40),
          Text(client.phone),
        ],
      ),
    );
  }
}
