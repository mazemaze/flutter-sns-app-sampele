import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = Provider((ref) => Amplify.Auth.fetchAuthSession());

final authSession = FutureProvider<bool>((ref) async {
  final auth = await ref.watch(authProvider);
  return auth.isSignedIn;
});
