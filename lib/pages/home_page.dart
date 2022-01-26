import 'dart:async';

import 'package:flutter/material.dart';
import 'package:herewego/%20model/post_model.dart';
import 'package:herewego/pages/detail_page.dart';
import 'package:herewego/services/auth_service.dart';
import 'package:herewego/services/prefs_service.dart';
import 'package:herewego/services/rtdb_service.dart';


class Home_page extends StatefulWidget {
  const Home_page({Key? key}) : super(key: key);
  static final String id="home_page";

  @override
  _Home_pageState createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
 bool isLoading=false;
  List<Post>items=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apigetposts();

  }

 Future _opendetail()async{
    Map results= await Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context){
        return Detail_page();
      }
    ),);
if(results !=null  && results.containsKey("data")){
  print(results["data"]);
  _apigetposts();
}
  }
Future _apigetposts()async{
  setState(() {
    isLoading = true;
  });
    var id=await Prefs.loadUserId();
    RTDBService.getPosts(id).then((posts) => {
      _respPosts(posts),
    });
}
_respPosts(List<Post>posts){
  setState(() {
    isLoading = false;
    items = posts;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("All Post",style: TextStyle(color: Colors.white,fontSize: 30),),
        centerTitle: true,
       actions: [
         IconButton(
           onPressed: (){
             AuthService.signOutUser(context);
           },
           icon: Icon(Icons.exit_to_app_outlined,color: Colors.white,),
         )
       ],
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (ctx, i){
              return itemOfList(items[i]);
            },
          ),
          isLoading?
          Center(
            child: CircularProgressIndicator(),
          ): SizedBox.shrink(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _opendetail,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  Widget itemOfList(Post post){
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(post.firstname+"   "+post.lastname,style: TextStyle(color: Colors.black,fontSize: 20),),
          SizedBox(height: 10,),
          Text(post.date,style: TextStyle(color: Colors.black,fontSize: 16),),
          SizedBox(height: 10,),
          Text(post.content,style: TextStyle(color: Colors.black,fontSize: 18),),
        ],
      ),
    );
  }

}
