import 'package:flutter/material.dart';

import '../../strings/strings_provider.dart';
import '../../ui/app_bar.dart';
import '../../ui/buttons/primary_button.dart';
import '../../ui/buttons/text_button.dart';
import '../../ui/dialogs.dart';
import '../../ui/flexible_view.dart';
import '../../ui/form/text_form_field.dart';
import '../../ui/loading_overlay.dart';
import '../../utils/routing/routes.dart';
import '../../utils/validation/validators.dart';
import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
    this.bloc, {
    Key? key,
  }) : super(key: key);
  final LoginPageBloc bloc;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final s = StringsProvider.i.strings.login;

  String email = '';
  String password = '';

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final passwordNode = FocusNode();
  bool obscurePassword = true;

  @override
  void initState() {
    setListeners();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FlexibleView(
      child: LoadingOverlay(
        isLoading: widget.bloc.loadingStream,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildEmailField(),
                buildPasswordField(),
                buildForgotPassword(),
                SizedBox(height: 20),
                buildSubmit(),
                SizedBox(height: 5),
                buildSignUp(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEmailField() {
    return CekInTextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: Validators.email,
      textInputAction: TextInputAction.next,
      label: s.emailLabel,
      autofillHints: const [
        AutofillHints.email,
      ],
      onFieldSubmitted: (_) {
        passwordNode.requestFocus();
      },
    );
  }

  Widget buildPasswordField() {
    return CekInTextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: obscurePassword,
      validator: Validators.empty,
      textInputAction: TextInputAction.done,
      label: s.passwordLabel,
      suffix: IconButton(
        icon: Icon(
            obscurePassword ? Icons.visibility : Icons.visibility_off_rounded),
        onPressed: () {
          setState(() {
            obscurePassword = !obscurePassword;
          });
        },
      ),
      autofillHints: const [
        AutofillHints.password,
      ],
      onFieldSubmitted: (_) {
        submit();
      },
    );
  }

  Widget buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: PlainButton(
        onPressed: () {},
        label: s.forgotPasswordButton,
      ),
    );
  }

  Widget buildSignUp() {
    return PlainButton(
      onPressed: () {
        Navigator.of(context).pushNamed(Routes.signUp);
      },
      label: s.signUpButton,
    );
  }

  Widget buildSubmit() {
    return PrimaryButton(
      onPressed: submit,
      text: s.submitButton,
    );
  }

  void setListeners() {
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    });
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      final res = await widget.bloc.submit(email, password);
      if (res == null) {
        await Navigator.of(context).pushReplacementNamed(Routes.init);
        return;
      }
      await Dialogs.alertDialog(
        context: context,
        continueButton: s.continueDialogButton,
        message: res,
      );
    }
  }
}
