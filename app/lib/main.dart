import 'package:app/utils/database_helper.dart';
import "package:flutter/material.dart";

import 'models/user.dart';

List _users;
void main() async{

  var db=new DatabaseHelper();
  



  //add user
  //int savedUser=
  await db.saveUser(new User("kamal","hashi"));
  // print("User saved $savedUser");

  int count=await db.getCount();
  print("Count :$count");

  //retrieving a user
  User ana=await db.getUser(1);
  User anaUpdate=User.fromMap({
    "username":"Updateana",
    "password":"updatePass",
    "id":1
  });

  //update user
  await
  db.updateUser(anaUpdate);

  //get all users
  _users=await db.getAllUsers();

  for(int i=0;i<_users.length;i++){
    User user=User.map(_users[i]);
    print("Username: ${user.username} +User Id:${user.id}");
  }



  runApp(new MaterialApp(
    title:"Dayabase",
    home: new Home(),));
}
class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Database"),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      )
    );
  }
}