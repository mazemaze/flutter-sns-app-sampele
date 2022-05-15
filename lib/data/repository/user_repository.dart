import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_app/models/ModelProvider.dart';

final userRepositoryProvider = Provider((ref) => UserRepository());

class UserRepository {
  Future<bool> registerUser(String name) async {
    try {
      User user = User(name: name);
      final request = ModelMutations.create(user);
      final response = await Amplify.API.mutate(request: request).response;

      User? createdUser = response.data;
      if (createdUser == null) {
        print("Error" + response.errors.toString());
        return false;
      }
      return true;
    } on ApiException catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> registerNewPost(String content) async {
    try {
      Post post = Post(content: content, userId: "a");
      final request = ModelMutations.create(post);
      final response = await Amplify.API.mutate(request: request).response;

      Post? createdPost = response.data;
      if (createdPost == null) {
        print("Error" + response.errors.toString());
        return false;
      }
      return true;
    } on ApiException catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Post?>?> getAllPosts() async {
    try {
      final request = ModelQueries.list(Post.classType);
      final response = await Amplify.API.query(request: request).response;
      List<Post?>? posts = response.data?.items;
      if (posts == null) {
        print('errors: ' + response.errors.toString());
        return null;
      }
      return posts;
    } on ApiException catch (e) {
      print('Query failed: $e');
    }
    return null;
  }

  Future addNewFriend(User user) async {
    try {
      final newFriend = Friend();
      final request = ModelMutations.create(newFriend);

      final response = await Amplify.API.mutate(request: request).response;
      Friend? updatedUser = response.data;
      if (updatedUser == null) {
        print('errors: ' + response.errors.toString());
        return false;
      }
      return true;
    } on ApiException catch (e) {
      print('Mutation failed: $e');
      return false;
    }
  }
}
