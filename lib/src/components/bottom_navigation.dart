import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            spreadRadius: 10,
          ),
        ],
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        backgroundColor: Colors.transparent,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        onTap: onTap,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/system/home.png', height: 30 , color: Colors.grey),
            label: 'Home',
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/system/home.png', height: 30, color: Colors.pink),
                Icon(Icons.circle, size: 8, color: Colors.pink),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/system/calender.png', height: 30, color: Colors.grey),
            label: 'Schedule',
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/system/calender.png', height: 30, color: Colors.pink),
                const Icon(Icons.circle, size: 8, color: Colors.pink),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/system/heart.png', height: 30, color: Colors.grey),
            label: 'Favorites',
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/system/heart.png', height: 30, color: Colors.pink),
                Icon(Icons.circle, size: 8, color: Colors.pink),
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/system/profile.png', height: 30, color: Colors.grey),
            label: 'Profile',
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icons/system/profile.png', height: 30, color: Colors.pink),
                Icon(Icons.circle, size: 8, color: Colors.pink),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
