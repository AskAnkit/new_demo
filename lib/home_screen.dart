import 'package:flutter/material.dart';
import 'package:new_demo/helper/user_model.dart';
import 'package:new_demo/helper/user_repository.dart';
import 'package:new_demo/map_screen.dart';
import 'package:new_demo/screens/all_user_page.dart';
import 'package:new_demo/screens/create_account.dart';
import 'package:new_demo/screens/todo_lists.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Login"),),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
          /*    TextField(
              controller: _name,

              ),
             // Image.network("http://202.164.42.227:3556/uploads/users/136ff708-399b-41f3-b7cb-82f09d7c981fd900d5f5-e44d-4898-ae9a-5bfeb5b2504fburger.jpg"),

              ElevatedButton(onPressed: (){
                UserModel model = UserModel();
                model.id = DateTime.now().millisecondsSinceEpoch;
                model.name = _name.text;
                UserRepository().createUser(model);
                _name.clear();

              }, child: const Text("Add user")),
              const SizedBox(height: 50,),
              ElevatedButton(onPressed: ()async{
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const MapScreen()));
            *//*  var res =  await UserRepository().getAllUsers();
              print(res.toString());*//*
              }, child: const Text("GO TO Map")),
              const SizedBox(height: 50,),
              ElevatedButton(
                  onPressed: ()async{
             //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ToDoListScreen()));
            *//*  var res =  await UserRepository().getAllUsers();
              print(res.toString());*//*
              }, child: const Text("To-App")),*/

              ElevatedButton(
                  onPressed: ()async{
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AllUserPage()));
            /*  var res =  await UserRepository().getAllUsers();
              print(res.toString());*/
              }, child: const Text("all User")),

              ElevatedButton(
                  onPressed: ()async{
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const CreateAccount()));
            /*  var res =  await UserRepository().getAllUsers();
              print(res.toString());*/
              }, child: const Text("Create User")),
            ],
          ),
        ),
      ),

    );
  }
}
