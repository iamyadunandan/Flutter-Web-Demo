import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class MockLikes extends StatefulWidget {
  String youLikeThis = '';
  MockLikes({Key key}) : super(key: key);

  @override
  _MockLikesState createState() => _MockLikesState();
}

class _MockLikesState extends State<MockLikes> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        Duration(
          seconds: 1,
        ), () {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.grey[200],
          content: Text('Try to like the posts..',style: TextStyle(color: Colors.grey[900]),),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Mockbook',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: GridView(
          padding: EdgeInsets.fromLTRB(0, 16, 0, 16),
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1, childAspectRatio: 1, mainAxisSpacing: 32),
          children: <Widget>[
            LikeWall(
              asset: 'assets/melon.png',
              name: 'Melon',
            ),
            LikeWall(
              asset: 'assets/leg.png',
              name: 'Leg',
            ),
            LikeWall(
              asset: 'assets/omlet.png',
              name: 'Omlet',
            ),
          ],
        ),
      ),
    );
  }
}

class LikeWall extends StatefulWidget {
  String youLikeThis = '';
  final String name;
  final String asset;
  LikeWall({this.asset, this.name, Key key}) : super(key: key);

  @override
  _LikeWallState createState() => _LikeWallState();
}

class _LikeWallState extends State<LikeWall> {
  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[50],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              widget.name + ' added a foto',
              style: TextStyle(
                  fontWeight: FontWeight.w700, fontFamily: 'ZillaSlab'),
            ),
            Divider(),
            Image.asset(widget.asset),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  behavior: HitTestBehavior.deferToChild,
                  child: Container(
                    child: LikeButton(
                      isLiked: widget.youLikeThis.length != 0,
                      animationDuration: Duration(seconds: 1),
                      onTap: (b) async {
                        changeLikes();
                        return !b;
                      },
                    ),
                  ),
                  onTap: () {},
                ),
                Text(widget.youLikeThis),
              ],
            ),
          ],
        ),
      ),
    );
  }

  changeLikes() {
    if (widget.youLikeThis.length == 0) {
      widget.youLikeThis = 'You like this';
    } else {
      widget.youLikeThis = '';
    }
    Future.delayed(Duration(seconds: 1), () {
      setState(() {});
    });
  }
}
