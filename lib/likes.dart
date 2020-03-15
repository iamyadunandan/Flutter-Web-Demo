import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iamyadunandan/Rate.dart';
import 'package:iamyadunandan/background.dart';
import 'package:iamyadunandan/mock_likes.dart';
import 'package:iamyadunandan/theme.dart';

class Likes extends StatefulWidget {
  MyTheme myTheme;
  Likes({this.myTheme, Key key}) : super(key: key);

  @override
  _LikesState createState() => _LikesState();
}

class _LikesState extends State<Likes> {
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
          Navigator.of(context).push(MaterialPageRoute(builder: (context){
            return Rate(myTheme:widget.myTheme);
          }));
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
            child: MockLikes(),
          ),
          Container(
            width: (size.width / 3) * 2,
            height: size.height,
            color: Colors.transparent,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Your likeable app',
                style: TextStyle(
                  fontFamily: 'QuickKiss',
                  color: widget.myTheme.t1Color,
                  fontSize: 64,
                ),
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
            child: MockLikes(),
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
