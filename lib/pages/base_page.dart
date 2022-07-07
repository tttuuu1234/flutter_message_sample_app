import 'package:flutter/material.dart';
import 'package:flutter_message_sample_app/controllers/bottom_nav_bar_controller.dart';
import 'package:flutter_message_sample_app/pages/rooms_page.dart';
import 'package:flutter_message_sample_app/pages/settings_page.dart';
import 'package:flutter_message_sample_app/pages/users_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BasePage extends ConsumerWidget {
  const BasePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavBarController = ref.watch(bottomNavBarProvider);
    final bottomNavBarNotifier = ref.read(bottomNavBarProvider.notifier);
    final pages = [
      {'title': 'Users', 'body': const UsersPage()},
      {'title': 'Rooms', 'body': const RoomsPage()},
      {'title': 'Settings', 'body': const SettingsPage()},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          pages[bottomNavBarController.currentIndex]['title'].toString(),
        ),
      ),
      body: pages[bottomNavBarController.currentIndex]['body'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          bottomNavBarNotifier.changeCurrentIndex(index);
        },
        currentIndex: bottomNavBarController.currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            activeIcon: Icon(Icons.person_outline),
            label: 'Users',
            tooltip: 'This is a Users Page',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            activeIcon: Icon(Icons.chat_outlined),
            label: 'Rooms',
            tooltip: 'This is a Rooms Page',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings),
            label: 'Settings',
            tooltip: 'This is a Settings Page',
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
