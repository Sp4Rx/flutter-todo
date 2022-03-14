import 'package:flutter/material.dart';
import 'package:todo/ui_elements/atoms/default_text.dart';
import 'package:todo/ui_elements/molecules/todo_card.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () => {}),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DefaultText('Todo List'),
              const SizedBox(
                height: 4,
              ),
              Flexible(
                child: ListView(
                  padding: const EdgeInsets.only(top: 56),
                  children: [
                    TodoCard(
                      todoData: 'THis is data',
                      date: '11 Mar, 3:54 PM',
                      onDelete: () => {},
                      onEdit: () => {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
