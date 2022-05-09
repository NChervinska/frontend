import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:frontend/cubit/app_control/app_control_cubit.dart';

import '../api/model/login_api_model.dart';
import '../cubit/login_cubit/login_cubit.dart';
import '../cubit/login_cubit/login_state.dart';
import '../di/locator.dart';
import '../l10n/app_localizations.dart';
import 'home_page/home_page.dart';
import 'view/dialog.dart';

enum AuthorizationField { email, password }

class AuthorizationPage extends StatefulWidget {
  static Widget create() {
    return BlocProvider(
      create: (context) => locator.get<LoginCubit>()..init(),
      child: const AuthorizationPage._(),
    );
  }

  const AuthorizationPage._({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthorizationPageState();
}

class _AuthorizationPageState extends State<AuthorizationPage> {
  final _formKey = GlobalKey<FormBuilderState>();
  Map<String, dynamic>? get _formValues => _formKey.currentState?.value;

  void _onPressedSaveButton() async {
    _formKey.currentState?.save();
    if (!(_formKey.currentState?.validate() ?? false)) return;

    await context.read<AppControlCubit>().getAdmin(
          _formValues?[AuthorizationField.email.name],
        );
    await context.read<LoginCubit>().login(LoginApiModel(
          email: _formValues?[AuthorizationField.email.name],
          password: _formValues?[AuthorizationField.password.name],
        ));
    await context
        .read<AppControlCubit>()
        .getAdmin(_formValues?[AuthorizationField.email.name]);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: ((context, state) {
        switch (state.status) {
          case LoginStatus.success:
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );

            break;
          case LoginStatus.error:
            Dialogs.of(context).showErrorDialog(state.errorMessage);
            break;
          default:
            break;
        }
      }),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.login),
        ),
        body: _buildFormBuilder(),
      ),
    );
  }

  Widget _buildFormBuilder() {
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
            FormBuilderTextField(
              name: AuthorizationField.email.name,
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
            FormBuilderTextField(
              name: AuthorizationField.password.name,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.password,
              ),
              valueTransformer: (text) => text?.trim(),
              validator: FormBuilderValidators.required(errorText: ''),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _onPressedSaveButton,
              child: Text(AppLocalizations.of(context)!.login.toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}
