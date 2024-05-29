import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/providers/todo_provider.dart';

class TasksDone extends StatelessWidget {
  const TasksDone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Done"),
      ),
      body: _displayTasksDone(context),
    );
  }
}

Widget _displayTasksDone(BuildContext context){
  ToDoProvider provider = Provider.of<ToDoProvider>(context);

  return ListView.builder(
    itemCount: provider.done.length,
    itemBuilder: (context, index){
      return ListTile(
        title: Text(provider.done[index]),
      );
    }
  );
}