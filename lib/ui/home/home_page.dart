import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sns_app/data/repository/user_repository.dart';
import 'package:sns_app/models/Post.dart';
import 'package:sns_app/ui/controller/post_controller.dart';
import 'package:sns_app/ui/home/home_view_model.dart';
import 'package:sns_app/ui/widgets/post_item.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postControllerProvider);
    final ctr = ref.watch(postControllerProvider.notifier);
    final t = ref.watch(userRepositoryProvider);
    final vm = ref.watch(homeVMProvider);
    if (posts == null) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("ホーム"),
        leading: TextButton(
          child: const Icon(
            Icons.logout,
            color: Colors.white,
          ),
          onPressed: () => Amplify.Auth.signOut(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showPostDialog(context, t, vm),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                ctr.init();
              },
              child: ListView.builder(
                itemCount: posts.length,
                itemBuilder: (ctx, i) {
                  final Post post = posts[i]!;
                  return PostItem(
                    post: post,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> showPostDialog(
      BuildContext context, UserRepository ref, HomeViewModel vm) {
    return showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        contentPadding: const EdgeInsets.all(8),
        children: [
          TextField(
            onChanged: vm.onContentChanged,
          ),
          ElevatedButton(
            onPressed: () async => {
              await vm.addNewPost(),
              Navigator.of(context).pop(),
            },
            child: const Text("投稿"),
          )
        ],
      ),
    );
  }
}
