import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/data/repository/user_repository.dart';

final homeVMProvider = ChangeNotifierProvider((ref) => HomeViewModel(ref.read));

class HomeViewModel with ChangeNotifier {
  final Reader _reader;
  HomeViewModel(this._reader);

  String? _content;
  String? get content => _content;

  void onContentChanged(String value) {
    _content = value;
    notifyListeners();
  }

  Future addNewPost() async {
    if (_content != null) {
      await _reader(userRepositoryProvider).registerNewPost(_content!);
    }
  }
}
