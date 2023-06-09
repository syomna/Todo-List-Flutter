import 'package:flutter/material.dart';
import 'package:todo/models/todo_model.dart';

class TodoController extends ChangeNotifier {
  final List<TodoModel> _todos = [
    TodoModel(task: 'Go to Gym', isCompleted: false),
    TodoModel(task: 'Buy some milk', isCompleted: true),
  ];

  List<TodoModel> get todos => _todos;
  int get todosCount => _todos.length;
  int get completedTodos =>
      _todos.where((element) => element.isCompleted).length;
  int get unCompletedTodos =>
      _todos.where((element) => !element.isCompleted).length;

  void addTodo(TodoModel todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void updateTodo(TodoModel todo) {
    todo.isCompleted = !todo.isCompleted;
    notifyListeners();
  }

  void deleteTodo(TodoModel todo) {
    _todos.remove(todo);
    notifyListeners();
  }
}
