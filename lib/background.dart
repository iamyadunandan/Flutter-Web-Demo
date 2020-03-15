import 'package:flutter/material.dart';
import 'package:iamyadunandan/dot.dart';

class BackGround extends StatefulWidget {
  int cellSizeDivider;
  Color bColor;
  BackGround({this.bColor, Key key}) : super(key: key);

  @override
  _BackGroundState createState() => _BackGroundState();
}

class _BackGroundState extends State<BackGround> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: GridView(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: cellSizeDivider,
        ),
        children: getDots(context),
      ),
      decoration: BoxDecoration(
        color: widget.bColor,
      ),
    );
  }


  getDots(context) {
    List<Widget> widgets = [];
    doMath(context);
    int totalBox = w * h;
    while (totalBox > 0) {
      widgets.add(Dot(size: cellSize));
      totalBox = totalBox - 1;
    }
    return widgets;
  }



  int cellSizeDivider = 24;
  int h;
  int w;
  double cellSize;

  doMath(context) {
    var size = MediaQuery.of(context).size;
    if (size.height < size.width) {
      cellSize = size.width / cellSizeDivider;
      h = (size.height / cellSize).ceil();
      w = (size.width / cellSize).ceil();
    } else {
      cellSize = size.height / cellSizeDivider;
      h = (size.width / cellSize).ceil();
      w = (size.height / cellSize).ceil();
    }
  }
}