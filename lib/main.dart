
import 'package:flutter/material.dart';
import 'package:herewego/pages/home_page.dart';
import 'package:herewego/pages/signin_page.dart';
import 'package:herewego/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase demo',

      home: Sign_up(),
      routes: {
        Home_page.id:(context)=>Home_page(),
        Sign_in.id:(context)=>Sign_in(),
        Sign_up.id:(context)=>Sign_up(),
      },
    );
  }
}