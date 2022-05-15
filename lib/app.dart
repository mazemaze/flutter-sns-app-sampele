import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sns_app/ui/confirmation/confirmation_page.dart';
import 'package:sns_app/ui/controller/auth_controller.dart';
import 'package:sns_app/ui/login/login_page.dart';
import 'package:sns_app/ui/navigation/navigation_page.dart';

class SNSApp extends HookConsumerWidget {
  const SNSApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authSession);
    return MaterialApp(
      routes: {
        ConfirmationPage.routeName: (_) => const ConfirmationPage(),
      },
      home: auth.when(
        data: ((isLogin) {
          if (isLogin) {
            return const NavigationPage();
          }
          return const LoginPage();
        }),
        error: (err, stack) => const Text(
          "Something happened",
        ),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
