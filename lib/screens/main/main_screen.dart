import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/screens/main/bloc/main_bloc.dart';
import 'package:todo/screens/splash_screen.dart';
import 'package:todo/screens/todo_home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final MainBloc _bloc = MainBloc();

  @override
  void initState() {
    super.initState();
    _bloc.add(StartLoadingEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is MainInitial) {
            return const SplashScreen();
          } else if (state is MainLoaded) {
            return const TodoHome();
          }
          return Container();
        });
  }
}
