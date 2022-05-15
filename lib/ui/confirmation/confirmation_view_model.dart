import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/data/repository/auth_repository.dart';

final confirmationVMProvider =
    ChangeNotifierProvider((ref) => ConfirmationViewModel(ref.read));

class ConfirmationViewModel with ChangeNotifier {
  String? _confirmationCode;
  String? get confirmationCode => _confirmationCode;

  final Reader _reader;
  ConfirmationViewModel(this._reader);

  void onChanged(String value) {
    _confirmationCode = value;
    notifyListeners();
  }

  Future<bool> confirm(String? username, String? password) async {
    if (username != null && password != null && _confirmationCode != null) {
      final result = await _reader(authRepositoryProvider).confirm(
        username,
        password,
        _confirmationCode!,
      );
      return result;
    }
    return false;
  }
}
