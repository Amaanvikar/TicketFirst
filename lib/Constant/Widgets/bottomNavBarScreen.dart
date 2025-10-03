import 'package:flutter/material.dart';

class CommonBottomNavigation extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CommonBottomNavigation({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/Vector copy 3.png", height: 24),
          label: "Dashboard",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/material-symbols_trip.png",
            height: 24,
          ),
          label: "My Trips",
        ),
        BottomNavigationBarItem(
          icon: Image.asset("assets/images/Vector (1) copy.png", height: 24),
          label: "Offers",
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            "assets/images/iconamoon_profile-fill.png",
            height: 24,
          ),
          label: "Profile",
        ),
      ],
    );
  }
}
