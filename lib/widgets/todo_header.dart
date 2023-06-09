import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/models/todo_controller.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 70, 40, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: Icon(
              Icons.list,
              size: 30,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            'Todo List',
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              _count('${context.watch<TodoController>().todosCount} Todos'),
              const SizedBox(
                width: 10,
              ),
              _count(
                '${context.watch<TodoController>().completedTodos} Completed',
              ),
              const SizedBox(
                width: 10,
              ),
              _count(
                '${context.watch<TodoController>().unCompletedTodos} Uncompleted',
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _count(String text) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}
