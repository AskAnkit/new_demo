import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateNotifierProvider<Counter, Map<String, dynamic>>((_) => Counter());

class Counter extends StateNotifier<Map<String, dynamic>> {
  Counter() : super({});

  void displayFile(String name, String email, String address) {
    Map<String, dynamic> cartMap = {"name": name,
      "email": email,
      "address": address};

    state = {...state, ...cartMap};
  }
}