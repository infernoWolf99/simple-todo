import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controller = TextEditingController();

  void _submitTask() {
    final taskTitle = _controller.text.trim();
    if (taskTitle.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task title cannot be empty')));
    } else {
      Provider.of<TaskProvider>(context, listen: false).addTask(taskTitle);
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Task")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _controller, decoration: InputDecoration()),
            ElevatedButton(onPressed: _submitTask, child: Text('Add To-Do')),
          ],
        ),
      ),
    );
  }
}

////mark a task as completed, checkbox style
