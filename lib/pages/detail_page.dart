import 'dart:io';
import 'package:flutter/material.dart';
import 'package:herewego/%20model/post_model.dart';
import 'package:herewego/services/prefs_service.dart';
import 'package:herewego/services/rtdb_service.dart';

class Detail_page extends StatefulWidget {
  const Detail_page({Key? key}) : super(key: key);
  static final String id="detail_page";

  @override
  _Detail_pageState createState() => _Detail_pageState();
}

class _Detail_pageState extends State<Detail_page> {
  var isLoading = false;
  var firstnamecontroller=TextEditingController();
  var lastnamecontroller=TextEditingController();
  var datecontroller=TextEditingController();
  var contentcontroller=TextEditingController();
 AddPost()async{
   setState(() {
     isLoading = true;
   });
String firstname=firstnamecontroller.text.toString().trim();
String lastname=lastnamecontroller.text.toString().trim();
String date=datecontroller.text.toString().trim();
String content=contentcontroller.text.toString().trim();
if(firstname.isEmpty||lastname.isEmpty||content.isEmpty||date.isEmpty) return;
_apiaddpost(firstname,lastname,content,date);
 }
 _apiaddpost(String firstname,String lastname,String content, String date)async{
   var id=await Prefs.loadUserId();
   RTDBService.addPost(new Post(id, firstname,lastname, content,date)).then((responce) => {
     _respAddPost(),
   });
 }

 _respAddPost(){
   setState(() {
     isLoading = false;
   });
Navigator.of(context).pop({"data":"done"});
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Add Post",style: TextStyle(color: Colors.white),),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.all(30),
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  TextField(
                    controller: firstnamecontroller,
                    decoration: InputDecoration(
                      hintText: "Firstname",
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: lastnamecontroller,
                    decoration: InputDecoration(
                      hintText: "Lastname",
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: contentcontroller,
                    decoration: InputDecoration(
                      hintText: "Content",
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextField(
                    controller: datecontroller,
                    decoration: InputDecoration(
                      hintText: "Date",
                    ),
                  ),
                  SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 45,
                    child: FlatButton(
                      onPressed: AddPost,
                      color: Colors.red,
                      child: Text("Add",style: TextStyle(color: Colors.white,),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          isLoading? Center(
            child: CircularProgressIndicator(),
          ): SizedBox.shrink(),
        ],
      ),
    );
  }
}
