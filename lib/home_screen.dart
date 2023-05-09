import 'package:flutter/material.dart';
import 'package:new_demo/helper/user_model.dart';
import 'package:new_demo/helper/user_repository.dart';
import 'package:new_demo/map_screen.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  final TextEditingController _name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text("Login"),),
      body: Container(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children:  [
            TextField(
            controller: _name,

            ),

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
          /*  var res =  await UserRepository().getAllUsers();
            print(res.toString());*/
            }, child: const Text("GO TO Map"))
          ],
        ),
      ),

    );
  }
}
