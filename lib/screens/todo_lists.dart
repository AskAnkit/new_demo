import 'package:flutter/material.dart';
import 'package:new_demo/helper/user_model.dart';
import 'package:new_demo/helper/user_repository.dart';

class ToDoListScreen extends StatefulWidget {
  num id;
   ToDoListScreen({Key? key,required this.id}) : super(key: key);

  @override
  State<ToDoListScreen> createState() => _ToDoListScreenState();
}

class _ToDoListScreenState extends State<ToDoListScreen> {
  TextEditingController todo = TextEditingController();
  late UserRepository repository;
  List<UserModel> activityList = [];
  @override
  void initState() {
     repository = UserRepository();
     _getActivity();
    super.initState();
  }
  _getActivity()async{
    activityList.clear();
    activityList = await repository.getAllPostOfUser(widget.id.toInt());
    setState(() { });
    print(activityList.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To do lists"),),
      body:ListView.builder(
        itemCount: activityList.length,
        itemBuilder: (BuildContext context, int index) {
          var data = activityList[index];
          return ListTile(
            title: Text(data.content??""),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          _alert();
      },child: const Center(
        child: Icon(Icons.add),
      ),),
    );
  }
_alert()async{
  await showDialog(
  context: context,
  builder: (context) => AlertDialog(
    title: const Text('Message'),
    content: TextFormField(
      controller: todo,

    ),
    actions: <Widget>[
      ElevatedButton(
        onPressed: () {
          if(todo.text.trim().isNotEmpty){
            Navigator.of(context, rootNavigator: true).pop();
            setState(() {

            });
            repository.insertData(UserModel(user_id: widget.id.toInt(),content:todo.text));
            activityList.insert(0, UserModel(user_id: widget.id.toInt(),content:todo.text));
            todo.clear();

          }
          },
        child: const Text('OK'),
      ),
    ],
  ),
  );
}
}

