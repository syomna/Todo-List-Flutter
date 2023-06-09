import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_controller.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todos = context.watch<TodoController>().todos;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => ListTile(
          onTap: () {
            context.read<TodoController>().updateTodo(todos[index]);
          },
          onLongPress: () {
            //
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      actionsAlignment: MainAxisAlignment.center,
                      title: const Text(
                          'Are you sure you wanna delete this todo?'),
                      actions: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: Colors.red,
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            context
                                .read<TodoController>()
                                .deleteTodo(todos[index]);
                            Navigator.of(context).pop();
                          },
                          color: Colors.green,
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ));
          },
          title: Text(
            todos[index].task,
            style: TextStyle(
                fontSize: 20,
                decoration: todos[index].isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none),
          ),
          trailing: Checkbox(
              value: todos[index].isCompleted,
              onChanged: (value) {
                context.read<TodoController>().updateTodo(todos[index]);
              }),
        ),
      ),
    );
  }
}
