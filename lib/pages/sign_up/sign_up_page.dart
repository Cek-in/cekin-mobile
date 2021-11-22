import 'package:cek_in/ui/dialogs.dart';
import 'package:cek_in/utils/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../strings/strings_provider.dart';
import '../../ui/flexible_view.dart';
import '../../ui/form/text_form_field.dart';
import '../../ui/loading_overlay.dart';
import '../../utils/validation/validators.dart';
import 'sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  final SignUpBloc bloc;
  const SignUpPage(this.bloc, {Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final s = StringsProvider.i.strings.signUp;

  final passwordNode = FocusNode();
  final passwordConfirmNode = FocusNode();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  String email = '';
  String password = '';
  String passwordConfirm = '';

  @override
  void initState() {
    super.initState();

    setListeners();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordConfirmController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(s.appBarTitle),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FlexibleView(
      child: LoadingOverlay(
        isLoading: widget.bloc.isLoadingStream,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                buildEmailField(),
                buildPasswordField(),
                buildConfirmPasswordField(),
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
      validator: Validators.email,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.email],
      onFieldSubmitted: (_) {
        passwordNode.requestFocus();
      },
      label: s.emailLabel,
    );
  }

  Widget buildPasswordField() {
    return CekInTextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: obscurePassword,
      validator: Validators.strongPassword,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.newPassword],
      onFieldSubmitted: (_) {
        passwordConfirmNode.requestFocus();
      },
      label: s.passwordLabel,
    );
  }

  Widget buildConfirmPasswordField() {
    return CekInTextFormField(
      controller: passwordConfirmController,
      keyboardType: TextInputType.text,
      obscureText: obscureConfirmPassword,
      autofillHints: const [AutofillHints.newPassword],
      validator: (value) => Validators.matchValue(value, password),
      textInputAction: TextInputAction.done,
      onFieldSubmitted: (_) {
        submit();
      },
      label: s.passwordConfirmLabel,
    );
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

  void setListeners() {
    emailController.addListener(() {
      email = emailController.text;
    });
    passwordController.addListener(() {
      password = passwordController.text;
    });
    passwordConfirmController.addListener(() {
      passwordConfirm = passwordConfirmController.text;
    });
  }
}
