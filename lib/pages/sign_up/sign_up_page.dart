import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../strings/strings_provider.dart';
import '../../ui/buttons/primary_button.dart';
import '../../ui/dialogs.dart';
import '../../ui/flexible_view.dart';
import '../../ui/form/text_form_field.dart';
import '../../ui/loading_overlay.dart';
import '../../utils/routing/routes.dart';
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

  final fNameController = TextEditingController();
  final lNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmController = TextEditingController();

  final s = StringsProvider.i.strings.signUp;

  final lNameNode = FocusNode();
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  final passwordConfirmNode = FocusNode();
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  String fName = '';
  String lName = '';
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
    fNameController.dispose();
    lNameController.dispose();
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
                buildFNameField(),
                buildLNameField(),
                buildEmailField(),
                buildPasswordField(),
                buildConfirmPasswordField(),
                SizedBox(height: 20),
                PrimaryButton(
                  text: s.btSubmit,
                  onPressed: submit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFNameField() {
    return CekInTextFormField(
      controller: fNameController,
      validator: Validators.empty,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      autofillHints: const [AutofillHints.givenName],
      onFieldSubmitted: (_) {
        lNameNode.requestFocus();
      },
      label: s.firstName,
    );
  }

  Widget buildLNameField() {
    return CekInTextFormField(
      controller: lNameController,
      validator: Validators.empty,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.next,
      focusNode: lNameNode,
      autofillHints: const [AutofillHints.familyName],
      onFieldSubmitted: (_) {
        emailNode.requestFocus();
      },
      label: s.lastName,
    );
  }

  Widget buildEmailField() {
    return CekInTextFormField(
      controller: emailController,
      validator: Validators.email,
      focusNode: emailNode,
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
      final res = await widget.bloc.submit(email, password, fName, lName);
      if (res == null) {
        await Dialogs.alertDialog(
          context: context,
          continueButton: s.continueDialogButton,
          title: s.successTitle,
          message: s.successContent,
          onContinue: () =>
              Navigator.of(context).pushReplacementNamed(Routes.init),
        );
        return;
      }
      await Dialogs.alertDialog(
        context: context,
        continueButton: s.continueDialogButton,
        title: s.failTitle,
        message: res,
      );
    }
  }

  void setListeners() {
    fNameController.addListener(() {
      fName = fNameController.text;
    });
    lNameController.addListener(() {
      lName = lNameController.text;
    });
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
