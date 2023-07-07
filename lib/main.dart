import 'package:flutter/material.dart';
import 'package:Dots_Demo_App/input.dart';
import 'package:Dots_Demo_App/map_page.dart';
import 'package:Dots_Demo_App/bottom_bar.dart';

void main() => runApp(MapTest());

class MapTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomBar(),
    );
  }
}
