import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/add_task.dart';
import 'package:to_do_app/screens/home_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TaskProvider>(create: (_) => TaskProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-do List',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/add': (context) => AddTaskScreen(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
