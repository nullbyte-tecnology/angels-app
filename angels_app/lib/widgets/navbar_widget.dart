import 'package:flutter/material.dart';

class NavbarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  NavbarWidget({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SafeArea(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Container(
            height: 70.0,
            decoration: const BoxDecoration(
              color: Color(0xFF7C3A66),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white70,
              currentIndex: selectedIndex,
              onTap: onItemTapped,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: 32.0,
              items: const [
                BottomNavigationBarItem(
                  label: "",
                  icon: Center(
                    child: Icon(Icons.home_outlined),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Center(
                    child: Icon(Icons.add_circle_outline_rounded),
                  ),
                ),
                BottomNavigationBarItem(
                  label: "",
                  icon: Center(
                    child: Icon(Icons.person_outline),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
