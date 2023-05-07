import 'package:cv/pages/HomeScreen.dart';
import 'package:cv/pages/Infos.dart';
import 'package:cv/pages/Projects.dart';
import 'package:cv/pages/Skills.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GNav(
      haptic: true,
      tabBorderRadius: 20,
      tabShadow: [
        BoxShadow(color: Colors.grey.withOpacity(0.3), blurRadius: 10)
      ],
      curve: Curves.easeOutExpo,
      duration: const Duration(milliseconds: 900),
      gap: 8,
      color: Colors.blue.shade900,
      activeColor: Colors.blue.shade900,
      iconSize: 30,
      tabBackgroundColor: Colors.blue.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      tabs: [
        GButton(
          icon: Icons.home,
          text: 'Home',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        GButton(
          icon: Icons.verified_user_outlined,
          text: 'Likes',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Infos(baseUrl: 'http://192.168.1.17:8000'),
                ));
          },
        ),
        GButton(
          icon: Icons.supervised_user_circle_sharp,
          text: 'Search',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Projects(),
                ));
          },
        ),
        GButton(
          icon: Icons.message,
          text: 'Profile',
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Skills(),
                ));
          },
        ),
      ],
    );
  }
}
