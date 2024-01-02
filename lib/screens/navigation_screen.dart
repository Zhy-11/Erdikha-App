import 'package:erdhika/screens/home_screen.dart';
import 'package:erdhika/screens/inbox_screen.dart';
import 'package:erdhika/screens/user_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavigationScreen extends StatefulWidget {
  // const NavigationScreen({super.key, required id, required name, required email, required token});

  final int id;
  final String name;
  final String email;
  final String token;

  NavigationScreen({required this.id, required this.name, required this.email, required this.token});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  String nama = 'fadjar';
  int _selectedIndex = 0;
  List screenBar = [
    HomeScreen(
      id: 1,
      name: 'fadjar',
      email: 'asdasd@hdasjkd',
      token: 'asdasdasd',
    ),
    InboxScreen(),
    UserScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   toolbarHeight: 0,
      //   backgroundColor: Colors.transparent,
      //   systemOverlayStyle: SystemUiOverlayStyle(
      //     statusBarColor: Color(0xff80B3FF)
      //   ),
      // ),
      body: screenBar.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_rounded),
            label: 'Inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded),
            label: 'User',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        // elevation: 50,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
      ),
    );
  }
}
