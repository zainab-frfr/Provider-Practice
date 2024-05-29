import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractice/pages/done.dart';
import 'package:providerpractice/providers/todo_provider.dart';

class MyToDoPage extends StatelessWidget {
  const MyToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To Do"),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> const TasksDone()));
            }, 
            icon: const Icon(Icons.navigate_next))
        ],
      ),
      body: _listToDo(context),
      bottomNavigationBar: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
        _showDialogue(context);
      }),
    );
  }
}

Widget _listToDo(BuildContext context) {
  ToDoProvider provider = Provider.of<ToDoProvider>(context);

  return ListView.builder(
      itemCount: provider.todo.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(provider.todo[index]),
          trailing: Checkbox(
              value: provider.done.contains(provider.todo[index]),
              onChanged: (value) {
                if (value == true) {
                  provider.markDone(provider.todo[index]);
                } else {
                  provider.removeDone(provider.todo[index]);
                }
              }),
        );
      });
}

void _showDialogue(BuildContext context) {
  ToDoProvider provider = Provider.of<ToDoProvider>(context, listen: false);

  TextEditingController cntrller = TextEditingController();
  showDialog(
      context: context,
      builder: ((context) {
        return AlertDialog(
          actions: [
            const SizedBox(height: 30),
            TextField(
              controller: cntrller,
              decoration: const InputDecoration(
                labelText: "Enter Task",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text("Ok"),
              onPressed: (){
                provider.addTask(cntrller.text);
                Navigator.of(context).pop();
              }
              )
            ],
        );
      }));
}
