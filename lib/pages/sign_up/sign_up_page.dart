import 'package:cek_in/strings/strings_provider.dart';
import 'package:cek_in/utils/validation/validators.dart';
import 'package:flutter/material.dart';

import '../../ui/flexible_view.dart';
import '../../ui/form/text_form_field.dart';
import '../../ui/loading_overlay.dart';
import 'sign_up_bloc.dart';

class SignUpPage extends StatefulWidget {
  final SignUpBloc bloc;
  const SignUpPage(this.bloc, {Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final s = StringsProvider.i.strings.signUp;

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

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
    return CekInTextFormField(controller: emailController);
  }

  Widget buildPasswordField() {
    return CekInTextFormField(
      controller: passwordController,
      keyboardType: TextInputType.text,
      obscureText: obscurePassword,
      validator: Validators.strongPassword,
      textInputAction: TextInputAction.done,
      label: s.passwordLabel,
    );
  }

  Widget buildConfirmPasswordField() {
    // TODO
    return CekInTextFormField(
      controller: passwordConfirmController,
      keyboardType: TextInputType.text,
      obscureText: obscureConfirmPassword,
      validator: Validators.strongPassword,
      textInputAction: TextInputAction.done,
      label: s.passwordLabel,
    );
  }
}
