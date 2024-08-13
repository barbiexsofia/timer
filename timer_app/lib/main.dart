import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:timer_app/tasks/bloc/task_bloc.dart';
import 'package:timer_app/tasks/ui/tasks_page.dart';
import 'package:timer_app/timer/ui/timer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Timer App'),
        ),
        body: const TabBarView(
          children: [
            Center(child: Text('Home')),
            Center(child: TimerPage()),
            Center(
              child: TasksPage(),
            ),
          ],
        ),
        bottomNavigationBar: const BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Symbols.temple_buddhist_rounded)),
              Tab(icon: Icon(Icons.timer)),
              Tab(icon: Icon(Symbols.playlist_add_rounded)),
            ],
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
          ),
        ),
      ),
    );
  }
}
