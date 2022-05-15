import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sns_app/ui/friends/friends_list_page.dart';
import 'package:sns_app/ui/home/home_page.dart';
import 'package:sns_app/ui/navigation/navigation_view_model.dart';

class NavigationPage extends HookConsumerWidget {
  const NavigationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(navigationVMProvider);
    List<Widget> widgets = [
      const HomePage(),
      const FriendsListPage(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "",
          ),
        ],
        currentIndex: vm.currentIdx,
        onTap: vm.onTap,
      ),
      body: widgets[vm.currentIdx],
    );
  }
}
