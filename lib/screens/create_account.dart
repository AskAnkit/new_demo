import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_demo/helper/user_model.dart';
import 'package:new_demo/helper/user_repository.dart';

class CreateAccount extends ConsumerStatefulWidget {
  const CreateAccount({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _CreateAccountState();
}

class _CreateAccountState extends ConsumerState<CreateAccount> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  late UserRepository _userRepository;
  @override
  void initState() {
    _userRepository = UserRepository();
    super.initState();
  }

  @override
  Widget build(BuildContext context,) {
    return Scaffold(
      appBar: AppBar(title: const Text("Create User"),),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child:   IntrinsicHeight(
                  child: Column(
                    children: [
                      TextFormField(
                        controller: userName,
                        decoration: const InputDecoration(
                          hintText: "User name"
                      ),),
                      TextFormField(
                        controller:password ,
                        decoration: const InputDecoration(
                          hintText: "Password"
                      ),),
                      const SizedBox(height: 50,),
                      ElevatedButton(onPressed: (){
                        _userRepository.createUser(UserModel(
                          name: userName.text,
                          password: password.text,
                        ));
                        userName.clear();
                        password.clear();
                         Navigator.of(context).pop();
                      },
                          child: const Text("Create Account")),

                    ],

                  ),
                ),),
            );
          },

        ),
      ),

    );
  }
}


