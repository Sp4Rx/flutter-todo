import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/todo/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc() : super(TodoLoading()) {
    on<TodoEvent>((event, emit) async {
      if (event is LoadTodos) {
        final prefs = await SharedPreferences.getInstance();
        final todosString = prefs.getString('todos');
        if (todosString != null && todosString.isEmpty) {
          emit(TodoEmpty());
        } else {
          final todos = (jsonDecode(todosString!) as List).map((e) {
            return Todo.fromJson(e);
          }).toList();
          emit(TodoLoaded(todos));
        }
      }
    });
  }
}
