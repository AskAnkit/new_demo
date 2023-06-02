import 'package:flutter/material.dart';
import 'package:new_demo/helper/user_model.dart';
import 'package:new_demo/helper/user_repository.dart';
import 'package:new_demo/screens/todo_lists.dart';

class AllUserPage extends StatefulWidget {
  const AllUserPage({Key? key}) : super(key: key);

  @override
  State<AllUserPage> createState() => _AllUserPageState();
}

class _AllUserPageState extends State<AllUserPage> {
  final List<UserModel> _users = [];
  late UserRepository _repository;
  @override
  void initState() {
    _repository = UserRepository();
    _getUsers();
    // TODO: implement initState
    super.initState();
  }

  _getUsers()async{
    _users.clear();
  var res =  await _repository.getAllUsers();
  if(res != null){
    for(var item in res){
      _users.add(item);
    }
  }
  setState(() {

  });

  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(title: const Text(" All users"),),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (BuildContext context, int index) {
          var data = _users[index];
          print(data.toJson().toString());
          return  ListTile(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (_)=> ToDoListScreen(id: data.id!,),));
            },
            title: Text(data.name??"bb"),
          );
        },
      ),
    );
  }
}
