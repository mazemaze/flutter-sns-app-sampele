import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/data/repository/user_repository.dart';

final authRepositoryProvider = Provider((ref) => AuthRepository(ref.read));

class AuthRepository {
  final Reader _reader;
  AuthRepository(this._reader);

  Future registration(String username, String password) async {
    try {
      SignUpResult res = await Amplify.Auth.signUp(
        username: username,
        password: password,
      );
      return true;
    } on AuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future confirm(
    String username,
    String password,
    String confirmationCode,
  ) async {
    try {
      SignUpResult res = await Amplify.Auth.confirmSignUp(
        username: username,
        confirmationCode: confirmationCode,
      );
      if (res.isSignUpComplete) {
        final bool dbResult =
            await _reader(userRepositoryProvider).registerUser(username);
        if (dbResult) {
          signIn(username, password);
          return true;
        }
      }
      return false;
    } on AuthException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future signIn(String username, String password) async {
    try {
      SignInResult res = await Amplify.Auth.signIn(
        username: username,
        password: password,
      );
    } on AuthException catch (e) {
      print(e.message);
    }
  }
}
