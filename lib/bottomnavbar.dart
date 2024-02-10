
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:untitled111/screens/screen1.dart';
import 'package:untitled111/screens/screen2.dart';
import 'package:untitled111/screens/screen3.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List Screens = [
    const Screen1(),
    const Screen2(),
    const Screen3(),
  ];
  int _selectedIndex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.red,
      bottomNavigationBar: CurvedNavigationBar(
        index:  _selectedIndex,
        backgroundColor: Colors.transparent,
        color: Colors.blueGrey,
        buttonBackgroundColor: Colors.grey,
        items: const [
          Icon(
            Icons.build,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.account_balance_outlined,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.sunny,
            size: 30,
            color: Colors.white,
          ),
        ],
        onTap: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      body: Screens[_selectedIndex],
    );
  }
}
