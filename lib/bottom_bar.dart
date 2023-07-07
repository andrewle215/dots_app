import 'package:flutter/material.dart';
import 'package:Dots_Demo_App/input.dart';
import 'package:Dots_Demo_App/map_page.dart';
import 'package:Dots_Demo_App/nav_drawer.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<BottomBar> {
  List<Widget> pages = [
    InputPage(),
    MyApp(),
  ];

  int i = 0;
  void _onTapped(int index) {
    setState(() {
      i = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PreferredSizeWidget> appbars = [
      AppBar(
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        backgroundColor: Colors.white,
        title: Image.asset('images/dots.jpg'),
      ),
      AppBar(
        iconTheme: IconThemeData(
          color: Colors.red,
        ),
        title: const Text(
          'Dots Map',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    ];

    return Scaffold(
      drawer: NavDrawer(),
      appBar: appbars[i],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: i,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.map,
              color: Colors.black,
            ),
            label: 'Map',
            backgroundColor: Colors.red,
          ),
        ],
        onTap: _onTapped,
        // selectedItemColor: Colors.grey,
      ),
      body: pages[i],
    );
  }
}
