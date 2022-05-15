import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/data/repository/auth_repository.dart';

final loginVMProvider =
    ChangeNotifierProvider((ref) => LoginViewModel(ref.read));

class LoginViewModel with ChangeNotifier {
  bool _isLogin = true;
  bool get isLogin => _isLogin;

  final bool _isOnPrgoress = false;
  bool get isOnProgress => _isOnPrgoress;

  String? _confirmationCode;
  String? get confirmationCode => _confirmationCode;

  String? _username;
  String? get username => _username;

  String? _password;
  String? get password => _password;

  final Reader _reader;

  LoginViewModel(this._reader);

  void signIn() async {
    if (_username != null && _password != null) {
      await _reader(authRepositoryProvider).signIn(_username!, _password!);
    }
  }

  Future registration() async {
    if (_username != null && _password != null) {
      final bool result = await _reader(authRepositoryProvider)
          .registration(_username!, _password!);
      return result;
    }
  }

  void confirm() async {
    if (_username != null && _password != null && _confirmationCode != null) {
      await _reader(authRepositoryProvider)
          .confirm(_username!, _password!, _confirmationCode!);
    }
  }

  void onConfirmationCodeChanged(String value) {
    _confirmationCode = value;
    notifyListeners();
  }

  void onEmailChanged(String value) {
    _username = value;
    notifyListeners();
  }

  void onPasswordChanged(String value) {
    _password = value;
    notifyListeners();
  }

  void toggle() {
    _isLogin = !_isLogin;
    notifyListeners();
  }
}
