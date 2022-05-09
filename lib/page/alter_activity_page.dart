import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../cubit/alter_activity_cubit/alter_activity_cubit.dart';
import '../cubit/alter_activity_cubit/alter_activity_state.dart';
import '../di/locator.dart';
import '../l10n/app_localizations.dart';
import '../model/activity.dart';

enum ActivityField {
  sleepHour,
  activeHour,
}

class AlterActivityPage extends StatefulWidget {
  final Activity? activity;
  static PageRoute getRoute(String animalId, [Activity? activity]) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => locator.get<AlterActivityCubit>(param1: animalId)
            ..init(activity?.id),
          child: AlterActivityPage._(activity: activity),
        );
      },
    );
  }

  const AlterActivityPage._({
    Key? key,
    this.activity,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AlterActivityPageState();
}

class _AlterActivityPageState extends State<AlterActivityPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic>? get _formValues => _formKey.currentState?.value;

  void _onPressedSaveButton() {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() ?? false) {
      final cubit = context.read<AlterActivityCubit>();
      if (widget.activity == null) {
        cubit.crete(
          sleepHour: int.parse(_formValues?[ActivityField.sleepHour.name]),
          activeHour: int.parse(_formValues?[ActivityField.activeHour.name]),
        );
      } else {
        cubit.update(
          id: widget.activity?.id ?? '',
          sleepHour: int.parse(_formValues?[ActivityField.sleepHour.name]),
          activeHour: int.parse(_formValues?[ActivityField.activeHour.name]),
        );
      }
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlterActivityCubit, AlterActivityState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: state.activity == null
                ? Text(AppLocalizations.of(context)!.createActivity)
                : Text(AppLocalizations.of(context)!.editActivity),
          ),
          body: _buildFormBuilder(state),
          floatingActionButton: _buildFloatingButton(),
        );
      },
    );
  }

  Widget _buildFormBuilder(AlterActivityState state) {
    return FormBuilder(
      key: _formKey,
      child: Center(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            vertical: 28,
            horizontal: 100,
          ),
          shrinkWrap: true,
          children: [
            const SizedBox(height: 16),
            _buildNumberFormField(
              ActivityField.sleepHour.name,
              AppLocalizations.of(context)!.sleepHours,
              widget.activity?.sleepHour,
            ),
            const SizedBox(height: 16),
            _buildNumberFormField(
              ActivityField.activeHour.name,
              AppLocalizations.of(context)!.activeHours,
              widget.activity?.activeHour,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberFormField(
    String name,
    String label,
    int? initialValue,
  ) {
    return FormBuilderTextField(
      name: name,
      initialValue: (initialValue ?? 0).toString(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: label,
      ),
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      valueTransformer: (text) => text?.trim(),
      validator: FormBuilderValidators.required(errorText: ''),
    );
  }

  Widget _buildFloatingButton() {
    return FloatingActionButton(
      onPressed: () => _onPressedSaveButton(),
      child: const Icon(Icons.check),
    );
  }
}
