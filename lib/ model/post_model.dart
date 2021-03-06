import 'dart:convert';

class Post{
   String userId;
   String firstname;
   String lastname;
   String content;
   String date;
   String img_url;

  Post(String userId, String firstname,String lastname, String content,String date,String img_url){
    this.userId=userId;
    this.firstname=firstname;
    this.lastname=lastname;
    this.content=content;
    this.date=date;
    this.img_url=img_url;
  }

  Post.fromJson(Map<String ,dynamic>json)
  : userId = json['userId'],
  firstname = json['firstname'],
  lastname = json['lastname'],
  content = json['content'],
  date = json['date'],
  img_url=json['img_url'];

  Map<String ,dynamic>toJson()=>{
    'userId':userId,
    'firstname':firstname,
    'lastname':lastname,
    'content':content,
    'date':date,
    'img_url':img_url,
  };
}