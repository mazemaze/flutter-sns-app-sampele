import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sns_app/ui/confirmation/confirmation_page.dart';
import 'package:sns_app/ui/login/login_view_model.dart';
import 'package:sns_app/ui/widgets/form_widget.dart';

class RegistrationInfo {
  String? username;
  String? password;
  RegistrationInfo({this.username, this.password});
}

class LoginPage extends HookConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(loginVMProvider);
    bool isLogin = true;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("SNS APP"),
              FormWidget(
                isLogin: vm.isLogin,
                onConfirmationCodeChanged: vm.onConfirmationCodeChanged,
                onPressed: () async => vm.isLogin
                    ? vm.signIn()
                    : vm.isOnProgress
                        ? vm.confirm()
                        : await vm.registration().then(
                              (value) => Navigator.of(context)
                                  .pushNamed(ConfirmationPage.routeName,
                                      arguments: RegistrationInfo(
                                        username: vm.username,
                                        password: vm.password,
                                      )),
                            ),
                onEmailChanged: vm.onEmailChanged,
                onPasswordChanged: vm.onPasswordChanged,
              ),
              TextButton(
                onPressed: () => vm.toggle(),
                child: Text(vm.isLogin ? "新規登録する" : "ログインする"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
