import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/pages/todo.dart';
import 'package:providerpractice/providers/todo_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ToDoProvider(),
    child: const MyApp()
    ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyToDoPage(),
    );
  }
}