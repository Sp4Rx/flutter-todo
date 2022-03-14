part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class LoadTodos extends TodoEvent {}

class AddTodo extends TodoEvent {
  final String data;

  AddTodo(this.data);
}

class DeleteTodo extends TodoEvent {
  final int id;

  DeleteTodo(this.id);
}

class EditTodo extends TodoEvent {
  final int id;
  final String data;

  EditTodo(this.id, this.data);
}
