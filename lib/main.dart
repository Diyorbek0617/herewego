
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase setting',

      home: Home_page(),
    );
  }
}
class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Firebase setting",style: TextStyle(color: Colors.black,fontSize: 30),),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text("Welcome",style: TextStyle(color: Colors.black,fontSize: 25),),
        ),
      ),
    );
  }
}
