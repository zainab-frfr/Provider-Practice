import 'package:flutter/material.dart';

class ToDoProvider extends ChangeNotifier{

  final List<String> _todo = [];
  final List<String> _done = [];

  List<String> get todo => _todo;
  List<String> get done => _done;

  void addTask(String task){
    _todo.add(task);
    notifyListeners();
  }

  void removeTask(String task){
    _todo.remove(task);
    notifyListeners();
  }

  void markDone(String task){
    _done.add(task);
    notifyListeners();
  }

  void removeDone(String task){
    _done.remove(task);
    notifyListeners();
  }

}