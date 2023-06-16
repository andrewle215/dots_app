import 'package:flutter/material.dart';
import 'package:Dots_Demo_App/input.dart';
import 'package:Dots_Demo_App/map_page.dart';

void main() => runApp(MapTest());

class MapTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main(),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
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
        backgroundColor: Colors.white,
        title: Image.asset('images/dots.jpg'),
      ),
      AppBar(
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
