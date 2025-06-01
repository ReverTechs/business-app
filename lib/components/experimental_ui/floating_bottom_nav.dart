import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class FloatingBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const FloatingBottomNav({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingNavbar(
      onTap: onTap,
      currentIndex: currentIndex,
      items: [
        FloatingNavbarItem(
          icon: Icons.home, //title: 'Home'
        ),
        FloatingNavbarItem(
          icon: Icons.explore, // title: 'Explore'
        ),
        FloatingNavbarItem(
          icon: Icons.chat_bubble_outline, //title: 'Chats'
        ),
        FloatingNavbarItem(
          icon: Icons.settings, // title: 'Settings'
        ),
      ],
    );
  }
}
