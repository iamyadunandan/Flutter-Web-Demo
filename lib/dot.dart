import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Dot extends StatefulWidget {
  double size;
  Dot({this.size, Key key}) : super(key: key);

  @override
  _DotState createState() => _DotState();
}

class _DotState extends State<Dot> {
  int seconds = 0;
  Color highlight = Colors.blueAccent;
  Color normal = Colors.transparent;
  Color color = Colors.transparent;
  List<Color> colors = [Colors.blueAccent,Colors.greenAccent,Colors.redAccent,Colors.amberAccent,Colors.tealAccent];


  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          seconds = 0;
          color = colors[Random().nextInt(colors.length)];
        });
      },
      onExit: (event) {
        setState(() {
          seconds = 3;
          color = normal;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.all(2),
        duration: Duration(seconds: seconds),
        decoration: BoxDecoration(
          //border: Border.all(color: color, width: 24),
          borderRadius: BorderRadius.circular(16),
          color: color
        ),
        height: widget.size,
        width: widget.size,
      ),
    );
  }
}
