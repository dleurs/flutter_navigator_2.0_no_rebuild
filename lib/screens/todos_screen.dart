import 'package:flutter/material.dart';
import 'package:new_navigation/models/todo.dart';
import 'package:new_navigation/navigation/app_config.dart';
import 'package:new_navigation/navigation/router_delegate.dart';

class TodosScreen extends StatelessWidget {
  final List<Todo> todos;

  TodosScreen({@required this.todos});

  static AppConfig getConfig() {
    return AppConfig(url: <String>["todo"]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            Todo todo = todos[index];
            return ListTile(
                title: Text(todo.name),
                subtitle: Text(todo.id.toString()),
                onTap: () {
                  (Router.of(context).routerDelegate as MyRouterDelegate)
                      .toTodoDetailsScreen(todo: todo);
                });
          }),
    );
  }
}
