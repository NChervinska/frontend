import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../constants/app_style_constants.dart';
import '../../../cubit/employee_cubit/employee_cubit.dart';
import '../../../model/employee.dart';

class EmployeeTile extends StatelessWidget {
  final Employee employee;

  const EmployeeTile({
    Key? key,
    required this.employee,
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
            '${employee.name} ${employee.surname}',
            style: AppStyleConstants.languageTile,
          ),
          const Icon(Icons.person, size: 40),
          Text(employee.phone),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => context.read<EmployeeCubit>().delete(employee.id),
          )
        ],
      ),
    );
  }
}
