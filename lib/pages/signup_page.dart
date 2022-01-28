import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:herewego/pages/home_page.dart';
import 'package:herewego/pages/signin_page.dart';
import 'package:herewego/services/auth_service.dart';
import 'package:herewego/services/prefs_service.dart';
import 'package:herewego/services/utills_service.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key key}) : super(key: key);
  static final String id="signup_page";

  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool isloading=false;
  var fullnamecontroller=TextEditingController();
  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();

  _dosign_up(){
    String name=fullnamecontroller.text.toString().trim();
    String email=emailcontroller.text.toString().trim();
    String password=passwordcontroller.text.toString().trim();
    if(name.isEmpty||email.isEmpty|| password.isEmpty)return;
    setState(() {
      isloading=true;
    });
    AuthService.signUpUser(context, name, email, password).then((firebaseUser) =>
    {
      _getfirebaseUser(firebaseUser),
    });
  }
  _getfirebaseUser(FirebaseUser firebaseUser)async{
    setState(() {
      isloading=false;
    });
    if(firebaseUser!=null){
      await Prefs.saveUserId(firebaseUser.uid);
      Navigator.pushReplacementNamed(context, Home_page.id);
    }
    else{
      Utils.fireToast("Check your information");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: fullnamecontroller,
                  decoration: InputDecoration(
                    hintText: "Fullname",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: emailcontroller,
                  decoration: InputDecoration(
                    hintText: "Email",
                  ),
                ),
                SizedBox(height: 10,),
                TextField(
                  controller: passwordcontroller,
                  decoration: InputDecoration(
                      hintText: "Password"
                  ),
                ),
                SizedBox(height: 20,),
                FlatButton(
                  onPressed: (){
                    _dosign_up();
                  },
                  color: Colors.red,
                  child: Text("Sign Up",style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Already have an account?",style: TextStyle(color: Colors.black,fontSize: 16),),
                    SizedBox(width: 8,),
                    GestureDetector(
                        onTap: (){
                          Navigator.pushReplacementNamed(context, Sign_in.id);
                        },
                        child: Text("Sign In",style: TextStyle(color: Colors.blue,fontSize: 16),)),
                  ],
                ),
              ],
            ),
          ),
          isloading==true?
              Center(
                child: CircularProgressIndicator(),
              ):
              SizedBox.shrink(),
        ],
      ),
    );
  }
}
