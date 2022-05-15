import 'package:flutter/material.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({
    Key? key,
    this.isLogin = true,
    required this.onPressed,
    required this.onEmailChanged,
    required this.onPasswordChanged,
    required this.onConfirmationCodeChanged,
  }) : super(key: key);
  final bool isLogin;
  final VoidCallback onPressed;
  final Function(String) onEmailChanged;
  final Function(String) onPasswordChanged;
  final Function(String) onConfirmationCodeChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: onEmailChanged,
          decoration: const InputDecoration(
            hintText: "Email",
          ),
        ),
        TextField(
          onChanged: onPasswordChanged,
          decoration: const InputDecoration(
            hintText: "Password",
          ),
        ),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(isLogin ? "ログイン" : "新規登録"),
        )
      ],
    );
  }
}
