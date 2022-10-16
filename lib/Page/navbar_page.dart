import 'package:flutter/material.dart';
import 'package:suaranabawiy/Page/utama/chat.dart';
import 'package:suaranabawiy/Page/utama/editor.dart';
import 'package:suaranabawiy/Page/utama/home.dart';
import 'package:suaranabawiy/Page/utama/player.dart';
import 'package:suaranabawiy/Page/utama/profile.dart';
import 'package:suaranabawiy/Page/utama/program.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({super.key});

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  int index = 0;
  // final screens = [
  //   Center(child: Text('Home', style: TextStyle(fontSize: 72))),
  //   Center(child: Text('Player', style: TextStyle(fontSize: 72))),
  //   Center(child: Text('Chat', style: TextStyle(fontSize: 72))),
  //   Center(child: Text('Program', style: TextStyle(fontSize: 72))),
  //   Center(child: Text('Profile', style: TextStyle(fontSize: 72))),
  // ];

  final screens = [
    HomePage(),
    EditorPage(),
    PlayerPage(),
    ChatPage(),
    ProgramPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: screens[index],
        bottomNavigationBar: NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: Colors.indigo,
            labelTextStyle: MaterialStateProperty.all(
              TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          child: NavigationBar(
            height: 75,
            backgroundColor: Colors.amber,
            labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
            selectedIndex: index,
            animationDuration: Duration(seconds: 2),
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home_filled),
                label: "Home",
              ),
              NavigationDestination(
                icon: Icon(Icons.audio_file_sharp),
                label: "Player",
              ),
              NavigationDestination(
                icon: Icon(Icons.chat),
                label: "Chat",
              ),
              NavigationDestination(
                icon: Icon(Icons.propane),
                label: "Program",
              ),
              NavigationDestination(
                icon: Icon(Icons.person),
                label: "Profile",
              ),
            ],
          ),
        ),
      );
}
