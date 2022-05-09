import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:frontend/page/register_page.dart';
import '../../../constants/constant_string.dart';
import '../../../cubit/employee_cubit/employee_cubit.dart';
import '../../../cubit/employee_cubit/employee_state.dart';
import '../../../di/locator.dart';
import '../../user_page.dart';
import '../view/employee_tile.dart';

class EmployeeTab extends StatelessWidget {
  const EmployeeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => locator.get<EmployeeCubit>()..init(),
        child: BlocBuilder<EmployeeCubit, EmployeeState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(),
              child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(UserPage.getRoute(
                        role: ConstantString.employee,
                        userId: state.employees[index].userId,
                      )),
                      child: EmployeeTile(
                        employee: state.employees[index],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
                itemCount: state.employees.length,
              ),
            );
          },
        ),
      ),
      floatingActionButton: IconButton(
        icon: const Icon(Icons.add),
        onPressed: () => Navigator.of(context).push(RegisterPage.getRoute()),
      ),
    );
  }
}
