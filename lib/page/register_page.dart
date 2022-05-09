import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../di/locator.dart';
import '../l10n/app_localizations.dart';

import '../cubit/register_cubit/register_cubit.dart';
import '../cubit/register_cubit/register_state.dart';
import '../model/employee.dart';

enum RegisterField {
  name,
  email,
  surname,
  phone,
}

class RegisterPage extends StatefulWidget {
  final Employee? employee;
  const RegisterPage._({Key? key, required this.employee}) : super(key: key);
  static PageRoute getRoute([Employee? employee]) {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => locator.get<RegisterCubit>(),
        child: RegisterPage._(employee: employee),
      ),
    );
  }

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic>? get _formValues => _formKey.currentState?.value;

  void _onPressedSaveButton(RegisterState state) {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() ?? false) {
      final cubit = context.read<RegisterCubit>();
      if (widget.employee == null) {
        cubit.register(
          email: _formValues?[RegisterField.email.name],
          name: _formValues?[RegisterField.name.name],
          phone: _formValues?[RegisterField.phone.name],
          surname: _formValues?[RegisterField.surname.name],
        );
      } else {
        cubit.editEmployee(
          email: _formValues?[RegisterField.email.name],
          name: _formValues?[RegisterField.name.name],
          phone: _formValues?[RegisterField.phone.name],
          surname: _formValues?[RegisterField.surname.name],
        );
      }
    }
  }

  void _onStateChange(
    BuildContext context,
    RegisterState state,
  ) {
    if (state.status == RegisterStatus.success) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<RegisterCubit, RegisterState>(
        listener: _onStateChange,
        builder: (context, state) {
          return FormBuilder(
            key: _formKey,
            child: Center(
              child: ListView(
                key: Key(widget.employee.toString()),
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                  vertical: 28,
                  horizontal: 100,
                ),
                shrinkWrap: true,
                children: [
                  const SizedBox(height: 16),
                  _buildTextFormField(
                    RegisterField.name.name,
                    AppLocalizations.of(context)!.name,
                    widget.employee?.name,
                  ),
                  const SizedBox(height: 16),
                  _buildTextFormField(
                    RegisterField.surname.name,
                    AppLocalizations.of(context)!.surname,
                    widget.employee?.surname,
                  ),
                  const SizedBox(height: 16),
                  _buildNumberFormField(widget.employee?.phone),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: RegisterField.email.name,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      labelText: AppLocalizations.of(context)!.email,
                    ),
                    valueTransformer: (text) => text?.trim(),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(errorText: ''),
                      FormBuilderValidators.email(errorText: ''),
                    ]),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () => _onPressedSaveButton(state),
                    child: Text(
                      AppLocalizations.of(context)!.register.toUpperCase(),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextFormField(String name, String label, String? initialValue) {
    return FormBuilderTextField(
      name: name,
      keyboardType: TextInputType.name,
      initialValue: initialValue,
      decoration: InputDecoration(labelText: label),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      valueTransformer: (text) => text?.trim(),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: ''),
        FormBuilderValidators.minLength(2, errorText: ''),
        FormBuilderValidators.maxLength(20, errorText: ''),
      ]),
    );
  }

  Widget _buildNumberFormField(String? initialValue) {
    return FormBuilderTextField(
      name: RegisterField.phone.name,
      initialValue: initialValue,
      keyboardType: TextInputType.number,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [
        MaskedInputFormatter(
          '###-###-####',
          allowedCharMatcher: RegExp('^[0-9]+\$'),
        ),
        LengthLimitingTextInputFormatter(12),
      ],
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.phone,
      ),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: ''),
        FormBuilderValidators.minLength(12, errorText: ''),
      ]),
    );
  }
}
