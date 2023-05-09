import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:new_demo/helper/database_helper.dart';
import 'package:new_demo/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseHelper().initDB();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomeScreen(),
    );
  }
}

