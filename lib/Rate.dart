import 'package:flutter/material.dart';
import 'package:iamyadunandan/background.dart';
import 'package:iamyadunandan/mock_rate.dart';
import 'package:iamyadunandan/theme.dart';

class Rate extends StatefulWidget {
  MyTheme myTheme;
  Rate({this.myTheme, Key key}) : super(key: key);

  @override
  _RateState createState() => _RateState();
}

class _RateState extends State<Rate> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    if (size.width < 700 || size.height < 400) {
      return Container();
    }
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            BackGround(
              bColor: widget.myTheme.bColor,
            ),
            getChildAccordingToWidth(context),
            getChangeOverlay(context),
          ],
        ),
      ),
    );
  }

  getChangeOverlay(context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: IconButton(
        iconSize: 32,
        icon: Icon(Icons.keyboard_arrow_down),
        onPressed: () {
          Navigator.of(context).pushNamed('/home');
        },
        color: widget.myTheme.t1Color,
      ),
    );
  }

  getChildAccordingToWidth(context) {
    Size size = MediaQuery.of(context).size;

    if (size.width > size.height) {
      return Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: size.width / 3,
            height: size.height,
            color: Colors.yellow,
            child: MockRate(),
          ),
          Container(
            width: (size.width / 3) * 2,
            height: size.height,
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Text(
                    'Your Rateable app',
                    style: TextStyle(
                      color: widget.myTheme.t1Color,
                      fontFamily: 'QuickKiss',
                      fontSize: 64,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          Container(
            width: size.width,
            height: (size.height / 3) * 2,
            color: Colors.yellow,
            child: MockRate(),
          ),
          Container(
            width: size.width,
            height: size.height / 3,
            color: Colors.grey[50],
          ),
        ],
      );
    }
  }
}
