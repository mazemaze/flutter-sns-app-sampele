import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/data/repository/user_repository.dart';
import 'package:sns_app/models/Post.dart';

final postControllerProvider =
    StateNotifierProvider<PostController, List<Post?>?>(
        (ref) => PostController(ref.read));

class PostController extends StateNotifier<List<Post?>?> {
  final Reader _reader;
  PostController(this._reader) : super(null) {
    init();
  }

  void init() async {
    state = await _reader(userRepositoryProvider).getAllPosts();
  }
}
