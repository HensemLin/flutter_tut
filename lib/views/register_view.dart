import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/auth_service.dart';
import 'package:mynotes/utilities/dialogs/error_dialog.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    super.initState();
    _email = TextEditingController();
    _password = TextEditingController();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("register"),
      ),
      body: Column(
        children: [
          TextField(
            controller: _email,
            enableSuggestions: false,
            autocorrect: false,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(hintText: 'Enter your email'),
          ),
          TextField(
            controller: _password,
            obscureText: true,
            enableSuggestions: false,
            autocorrect: false,
            decoration: const InputDecoration(hintText: "Enter your password"),
          ),
          TextButton(
              onPressed: () async {
                final email = _email.text;
                final password = _password.text;
                final navigate = Navigator.of(context);
                try {
                  await AuthService.firebase().createUser(
                    email: email,
                    password: password,
                  );
                  await AuthService.firebase().sendEmailVerification();
                  navigate.pushNamed(verifyEmailRoute);
                } on EmailAlreadyInUseAuthExecption {
                  if (mounted) {
                    await showErrorDialog(
                      context,
                      "Email is already in used",
                    );
                  }
                } on WeakPasswordAuthExecption {
                  if (mounted) {
                    await showErrorDialog(
                      context,
                      "Weak password",
                    );
                  }
                } on InvalidEmailAuthExecption {
                  if (mounted) {
                    await showErrorDialog(
                      context,
                      "This is an invalid email",
                    );
                  }
                } on GenericAuthException {
                  if (mounted) {
                    await showErrorDialog(
                      context,
                      "Registratin Error",
                    );
                  }
                }
              },
              child: const Text('Register')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil(
                  loginRoute,
                  (route) => false,
                );
              },
              child: const Text("Already registered? Login here."))
        ],
      ),
    );
  }
}
