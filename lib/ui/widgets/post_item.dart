import 'package:flutter/material.dart';
import 'package:sns_app/models/Post.dart';

class PostItem extends StatelessWidget {
  PostItem({Key? key, required this.post}) : super(key: key);
  Post? post;

  @override
  Widget build(BuildContext context) {
    // print(post?.user?.name);
    return ListTile(
      title: Row(
        children: const [
          // Text(post?.user?.name ?? "名無し"),
        ],
      ),
      subtitle: Text(post?.content ?? "内容なし"),
    );
  }
}
