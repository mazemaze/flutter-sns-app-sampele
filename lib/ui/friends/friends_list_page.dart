import 'package:flutter/material.dart';
import 'package:sns_app/data/repository/user_repository.dart';
import 'package:sns_app/ui/friends/friends_view_model.dart';

class FriendsListPage extends StatelessWidget {
  const FriendsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("友達リスト"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (ctx, i) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: const [
                        CircleAvatar(
                          radius: 32,
                          backgroundColor: Colors.black,
                        ),
                        Text("名無し"),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> showPostDialog(
      BuildContext context, UserRepository ref, FriendsViewModel vm) {
    return showDialog(
      context: context,
      builder: (ctx) => SimpleDialog(
        contentPadding: const EdgeInsets.all(8),
        children: [
          TextField(
            onChanged: vm.onNameChanged,
          ),
          ElevatedButton(
            onPressed: () => {
              vm.addNewFriend(),
              Navigator.of(context).pop(),
            },
            child: const Text("投稿"),
          )
        ],
      ),
    );
  }
}
