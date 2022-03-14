import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/edit_screen.dart';
import 'package:todo/screens/todo/bloc/todo_bloc.dart';
import 'package:todo/ui_elements/atoms/default_text.dart';
import 'package:todo/ui_elements/atoms/small_text.dart';
import 'package:todo/ui_elements/molecules/todo_card.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final TodoBloc _bloc = TodoBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(LoadTodos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const EditScreen(
                  editType: EditType.add,
                ),
              ),
            );
            _bloc.add(
              AddTodo(
                result[0],
              ),
            );
          }),
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
              BlocBuilder(
                bloc: _bloc,
                builder: (context, state) {
                  if (state is TodoLoading) {
                    return const DefaultText('Loading...');
                  } else if (state is TodoEmpty) {
                    return const DefaultText('No todos. Please add some new');
                  } else if (state is TodoLoaded) {
                    final todos = state.todos;
                    return Flexible(
                      child: ListView.separated(
                        padding: const EdgeInsets.only(top: 56, bottom: 42),
                        itemBuilder: (BuildContext context, int index) {
                          final todo = todos?[index];
                          return TodoCard(
                            todoData: todo!.data!,
                            date: DateTime.fromMillisecondsSinceEpoch(
                                    todo.timestamp!)
                                .toString(),
                            onDelete: () => {
                              _bloc.add(
                                DeleteTodo(todo.id!),
                              ),
                            },
                            onEdit: () => {},
                          );
                        },
                        // itemCount: state.todos?.length ?? 0,
                        itemCount: todos?.length ?? 0,
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 40,
                          );
                        },
                      ),
                    );
                  } else if (state is TodoError) {
                    return const SmallText('Something went wrong');
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
