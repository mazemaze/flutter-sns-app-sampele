import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sns_app/ui/confirmation/confirmation_view_model.dart';
import 'package:sns_app/ui/login/login_page.dart';

class ConfirmationPage extends HookConsumerWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  static const routeName = "confirmation";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(confirmationVMProvider);
    final arguments =
        ModalRoute.of(context)?.settings.arguments as RegistrationInfo;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                onChanged: vm.onChanged,
                decoration: const InputDecoration(
                  hintText: "Confirmation Code",
                ),
              ),
              ElevatedButton(
                onPressed: () => vm
                    .confirm(
                  arguments.username,
                  arguments.password,
                )
                    .then(
                  (value) {
                    if (value) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
                child: const Text("認証"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
