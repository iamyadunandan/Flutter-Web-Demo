import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class MockLogin extends StatefulWidget {
  MockLogin({Key key}) : super(key: key);

  @override
  _MockLoginState createState() => _MockLoginState();
}

class _MockLoginState extends State<MockLogin> {
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
          content: Text(
            'Try to login..',
            style: TextStyle(color: Colors.grey[900]),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepOrange[900],
        leading: BackButton(
          color: Colors.grey[50],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.deepOrange[900],
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ConstrainedBox(
              constraints: BoxConstraints.tightForFinite(),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(16),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Image.asset(
                      'assets/pizza.png',
                      height: 128,
                    ),
                    Padding(padding: EdgeInsets.all(16)),
                    Text(
                      'Please login',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      child: TextFormField(
                        autofocus: true,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.all(16)),
                    FlatButton.icon(
                      icon: Icon(Icons.keyboard_arrow_right),
                      onPressed: () {},
                      color: Colors.cyan,
                      label: Text(
                        'Mock Login',
                        style: TextStyle(color: Colors.grey[50]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
