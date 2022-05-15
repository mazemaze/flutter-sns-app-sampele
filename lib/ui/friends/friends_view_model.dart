import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FriendsViewModel with ChangeNotifier {
  final Reader _reader;
  FriendsViewModel(this._reader);
  String? _name;
  String? get name => _name;

  void onNameChanged(String value) {
    _name = value;
    notifyListeners();
  }

  void addNewFriend() async {
    // await _reader(userRepositoryProvider).addNewFriend(user);
  }
}
