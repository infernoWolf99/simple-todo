import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/add_task.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("My To-Do List")),
      body: taskProvider.tasks.isEmpty
          ? Center(child: Text('No to-dos today'))
          : Column(
              children: [
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTaskScreen(),
                      ),
                    ),
                  },
                  child: Text("Add new To-Do"),
                ),
              ],
            ),
    );
  }
}
