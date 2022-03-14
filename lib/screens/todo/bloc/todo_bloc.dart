import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/screens/todo/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  static const key = 'todos';
  List<Todo> todos = [];

  TodoBloc() : super(TodoLoading()) {
    on<TodoEvent>((event, emit) async {
      try {
        final prefs = await SharedPreferences.getInstance();
        if (event is LoadTodos) {
          final todosString = prefs.getString(key);
          if (todosString != null && todosString.isEmpty) {
            emit(TodoEmpty());
          } else {
            todos = (jsonDecode(todosString!) as List).map((e) {
              return Todo.fromJson(e);
            }).toList();
            if (todos.isNotEmpty) {
              emit(TodoLoaded(todos));
            } else {
              emit(TodoEmpty());
            }
          }
        } else if (event is AddTodo) {
          final newTodo = Todo(
              id: todos.last.id != null ? todos.last.id! + 1 : 0,
              data: event.data,
              timestamp: DateTime.now().millisecondsSinceEpoch);
          todos.add(newTodo);
          final newTodoString =
              jsonEncode(todos.map((e) => e.toJson()).toList());
          prefs.setString(key, newTodoString);
          emit(TodoLoaded(todos));
        }
      } catch (e, stacktrace) {
        emit(TodoError());
      }
    });
  }
}
