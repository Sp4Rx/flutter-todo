import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:todo/repository/repo.dart';
import 'package:todo/screens/todo/model/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  static const key = 'todos';
  List<Todo> todos = [];
  Repo repo = Repo();

  TodoBloc() : super(TodoLoading()) {
    on<TodoEvent>((event, emit) async {
      try {
        await repo.init();
        if (event is LoadTodos) {
          final todosString = repo.getData(key);
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
              id: todos.isNotEmpty ? todos.last.id! + 1 : 0,
              data: event.data,
              timestamp: DateTime.now().millisecondsSinceEpoch);
          todos.add(newTodo);
          emit(_serialiseAndEmit());
        } else if (event is DeleteTodo) {
          if (todos.isEmpty) {
            emit(TodoEmpty());
          } else {
            todos.removeWhere((element) => element.id == event.id);
            emit(_serialiseAndEmit());
          }
        } else if (event is EditTodo) {
          final newTodo = Todo(
              id: event.id,
              data: event.data,
              timestamp: DateTime.now().millisecondsSinceEpoch);
          todos.removeWhere((element) => element.id == event.id);
          todos.add(newTodo);
          emit(_serialiseAndEmit());
        }
      } catch (e, stacktrace) {
        emit(TodoError());
      }
    });
  }

  TodoState _serialiseAndEmit() {
    final newTodoString = jsonEncode(todos.map((e) => e.toJson()).toList());
    repo.setData(key, newTodoString);
    if (todos.isNotEmpty) {
      return TodoLoaded(todos);
    } else {
      return TodoEmpty();
    }
  }
}
