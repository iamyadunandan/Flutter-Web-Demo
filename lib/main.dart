import 'package:flutter/material.dart';
import 'package:iamyadunandan/Rate.dart';
import 'package:iamyadunandan/likes.dart';
import 'package:iamyadunandan/login.dart';
import 'package:iamyadunandan/my_home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home':(context){
          return MyHomePage();
        },
        '/login':(context){
          return Login();
        },
        '/likes':(context){
          return Likes();
        },
        '/rate':(context){
          return Rate();
        }
      },
    );
  }
}
