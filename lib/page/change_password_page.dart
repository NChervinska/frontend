import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import '../di/locator.dart';
import '../l10n/app_localizations.dart';
import '../cubit/change_password_cubit/change_password_cubit.dart';
import '../cubit/change_password_cubit/change_password_state.dart';

enum ChangePasswordField { newPassword, oldPassword }

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage._({Key? key}) : super(key: key);
  static PageRoute getRoute() {
    return MaterialPageRoute(
      builder: (context) => BlocProvider(
        create: (context) => locator.get<ChangePasswordCubit>(),
        child: const ChangePasswordPage._(),
      ),
    );
  }

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic>? get _formValues => _formKey.currentState?.value;

  void _onPressedSaveButton() {
    _formKey.currentState?.save();
    if (_formKey.currentState?.validate() ?? false) {
      final cubit = context.read<ChangePasswordCubit>();

      cubit.changePassword(
        newPassword: _formValues?[ChangePasswordField.newPassword.name],
        oldPassword: _formValues?[ChangePasswordField.oldPassword.name],
      );
    }
  }

  void _onStateChange(
    BuildContext context,
    ChangePasswordState state,
  ) {
    if (state.status == ChangePasswordStatus.success) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<ChangePasswordCubit, ChangePasswordState>(
        listener: _onStateChange,
        child: FormBuilder(
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
                _buildTextFormField(
                  ChangePasswordField.newPassword.name,
                  AppLocalizations.of(context)!.newPassword,
                ),
                const SizedBox(height: 16),
                _buildTextFormField(
                  ChangePasswordField.oldPassword.name,
                  AppLocalizations.of(context)!.oldPassword,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _onPressedSaveButton,
                  child: Text(
                    AppLocalizations.of(context)!.changePassword.toUpperCase(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(String name, String label) {
    return FormBuilderTextField(
      name: name,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(labelText: label),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      inputFormatters: [FilteringTextInputFormatter.singleLineFormatter],
      valueTransformer: (text) => text?.trim(),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(errorText: ''),
        FormBuilderValidators.minLength(2, errorText: ''),
        FormBuilderValidators.maxLength(12, errorText: ''),
      ]),
    );
  }
}
