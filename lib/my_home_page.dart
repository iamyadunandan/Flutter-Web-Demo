import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:iamyadunandan/background.dart';
import 'dart:html' as html;

import 'package:iamyadunandan/login.dart';
import 'package:iamyadunandan/theme.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  MyTheme myTheme = MyTheme(
      bColor: Colors.grey[200],
      t1Color: Colors.grey[900],
      t2Color: Colors.grey[800]);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    print(size);
    if (size.width < 700 || size.height < 400) {
      return Container();
    }
    return Builder(builder: (context) {
      return Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            getBackGround(context),
            getForeGround(context),
            getOverlay(context),
            getChangeOverlay(context),
          ],
        ),
      );
    });
  }

  getChangeOverlay(context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: IconButton(
        iconSize: 32,
        icon: Icon(Icons.keyboard_arrow_down),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return Login(myTheme: myTheme);
          }));
        },
        color: myTheme.t1Color,
        splashColor: myTheme.bColor,
        highlightColor: myTheme.bColor,
      ),
    );
  }

  bool darkTheme = false;

  getOverlay(context) {
    return Container(
        alignment: Alignment.topLeft,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FittedBox(
              child: Container(
                padding: EdgeInsets.all(4),
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: <Widget>[
                    Text(
                      'Switch Theme',
                      style: TextStyle(color: myTheme.t1Color),
                    ),
                    Switch(
                        activeColor: myTheme.t1Color,
                        value: darkTheme,
                        onChanged: (b) {
                          darkTheme = b;
                          if (b) {
                            setState(() {
                              myTheme.bColor = Colors.grey[900];
                              myTheme.t1Color = Colors.grey[50];
                              myTheme.t2Color = Colors.grey[200];
                            });
                          } else {
                            setState(() {
                              myTheme.bColor = Colors.grey[200];
                              myTheme.t1Color = Colors.grey[900];
                              myTheme.t2Color = Colors.grey[800];
                            });
                          }
                        }),
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  getForeGround(context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ClipOval(
                child: Image.asset(
                  'assets/me.png',
                  height: MediaQuery.of(context).size.height * 0.2,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width / 32),
              ),
              Text(
                'iamyadunandan',
                style: TextStyle(
                    fontSize: 72,
                    color: myTheme.t1Color,
                    fontFamily: 'QuickKiss'),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(16)),
          Container(
            padding: EdgeInsets.fromLTRB(MediaQuery.of(context).size.width * .2,
                0, MediaQuery.of(context).size.width * .2, 0),
            child: Text(
              'I\'m yadunandan 26, I\'m a Flutter Developer, Flutter is a open source cross platform framework which focusses on rapid app developement with beautiful fluidic UI, This whole interactive app is made with Flutter (check additional pages), I\'m available for work at UpWork.',
              style: TextStyle(
                color: myTheme.t2Color,
                fontFamily: 'ZillaSlab',
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              overflow: TextOverflow.clip,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(
                    Icons.email,
                    color: myTheme.t2Color,
                  ),
                  onPressed: () {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          'Email id copied to clipboard',
                          style: TextStyle(color: Colors.grey[50]),
                        ),
                        backgroundColor: Colors.blue,
                        duration: Duration(seconds: 1),                       
                      ),
                    );
                    Clipboard.setData(
                      ClipboardData(text: 'iamyadunandan@gmail.com'),
                    );
                  },
                  label: Text(
                    'iamyadunandan@gmail.com',
                    style: TextStyle(
                        fontFamily: 'ZillaSlab', color: myTheme.t2Color),
                  ),
                ),
                VerticalDivider(),
                FlatButton.icon(
                  icon: Icon(
                    Icons.work,
                    color: myTheme.t2Color,
                  ),
                  onPressed: () {
                    html.window.open('http://upwork.com', 'Yadunandan');
                  },
                  label: Text(
                    'upwork.com/iamyadunandan',
                    style: TextStyle(
                        fontFamily: 'ZillaSlab', color: myTheme.t2Color),
                  ),
                ),
                VerticalDivider(),
                FlatButton.icon(
                  icon: Icon(
                    Icons.code,
                    color: myTheme.t2Color,
                  ),
                  onPressed: () {
                    html.window.open('http://upwork.com', 'Yadunandan');
                  },
                  label: Text(
                    'github.com/iamyadunandan/demo',
                    style: TextStyle(
                        fontFamily: 'ZillaSlab', color: myTheme.t2Color),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getBackGround(context) {
    return BackGround(
      bColor: myTheme.bColor,
    );
  }
}
