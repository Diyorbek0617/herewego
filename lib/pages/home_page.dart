import 'package:flutter/material.dart';
import 'package:herewego/services/auth_service.dart';


class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);
  static final String id="home_page";

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Home",style: TextStyle(color: Colors.white,fontSize: 30),),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: Center(
          child: FlatButton(
              onPressed: (){
                AuthService.signOutUser(context);
              },
              color: Colors.red,
              child: Text("Log Out",style: TextStyle(color: Colors.black,fontSize: 25),)),
        ),
      ),
    );
  }
}
