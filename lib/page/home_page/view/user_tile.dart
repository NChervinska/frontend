import 'package:flutter/material.dart';
import '../../../api/model/user_response_model.dart';
import '../../../constants/app_style_constants.dart';

class UserTile extends StatelessWidget {
  final UserResponseModel user;

  const UserTile({
    Key? key,
    required this.user,
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
            user.email,
            style: AppStyleConstants.languageTile,
          ),
          const Icon(Icons.person, size: 40),
          Text(user.role),
        ],
      ),
    );
  }
}
