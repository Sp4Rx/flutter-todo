part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoLoading extends TodoState {}

class TodoLoaded extends TodoState {
  final List<Todo>? todos;
  TodoLoaded(this.todos);
}

class TodoEmpty extends TodoState {}

class TodoError extends TodoState {}
