
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herewego/pages/detail_page.dart';
import 'package:herewego/pages/home_page.dart';
import 'package:herewego/pages/signin_page.dart';
import 'package:herewego/pages/signup_page.dart';
import 'package:herewego/services/prefs_service.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
Widget _strartPage(){
  return StreamBuilder<FirebaseUser>(
    stream: FirebaseAuth.instance.onAuthStateChanged,
    builder: (BuildContext context,snapshot){
      if(snapshot.hasData){
        Prefs.saveUserId(snapshot.data.uid);
        return Home_page();
      }else{
        Prefs.removeUserId();
        return Sign_in();
      }
    },
  );
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase demo',

      home: _strartPage(),
      routes: {
        Home_page.id:(context)=>Home_page(),
        Sign_in.id:(context)=>Sign_in(),
        Sign_up.id:(context)=>Sign_up(),
        Detail_page.id:(context)=>Detail_page(),
      },
    );
  }
}