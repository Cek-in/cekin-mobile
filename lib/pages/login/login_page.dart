import 'package:flutter/material.dart';

import '../../strings/strings_provider.dart';
import '../../ui/buttons/primary_button.dart';
import '../../ui/dialogs.dart';
import '../../ui/flexible_view.dart';
import '../../ui/form/text_form_field.dart';
import '../../ui/loading_overlay.dart';
import '../../utils/routing/routes.dart';
import '../../utils/validation/validators.dart';
import 'login_bloc.dart';

class LoginPage extends StatefulWidget {
  final LoginPageBloc bloc;
  const LoginPage(
    this.bloc, {
    Key? key,
  }) : super(key: key);

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
      appBar: AppBar(
        title: Text(s.appBarTitle),
      ),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    return FlexibleView(
      child: LoadingOverlay(
        isLoading: widget.bloc.loadingStream,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ...buildForm(),
              buildSubmit(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildForm() {
    return [
      buildEmailField(),
      buildPasswordField(),
    ];
  }

  Widget buildEmailField() {
    return CekInTextFormField(
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      validator: Validators.email,
    );
  }

  Widget buildPasswordField() {
    return CekInTextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: true,
      validator: Validators.empty,
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
