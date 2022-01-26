import 'dart:convert';

class Post{
  late String userId;
  late String firstname;
  late String lastname;
  late String content;
  late String date;

  Post(String userId, String firstname,String lastname, String content,String date){
    this.userId=userId;
    this.firstname=firstname;
    this.lastname=lastname;
    this.content=content;
    this.date=date;
  }

  Post.fromJson(Map<String ,dynamic>json)
  : userId = json['userId'],
  firstname = json['firstname'],
  lastname = json['lastname'],
  content = json["content"],
  date = json["date"];

  Map<String ,dynamic>toJson()=>{
    'userId':userId,
    'firstname':firstname,
    'lastname':lastname,
    'content':content,
    'date':date,
  };
}