import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/providers/task_provider.dart';
import 'package:to_do_app/screens/add_task.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("My To-Do List")),
      body: taskProvider.tasks.isEmpty
          ? Column(
              children: [
                Text("No To-Dos today"),
                ElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddTaskScreen(),
                      ),
                    ),
                  },
                  child: Text('Add To-Do'),
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: taskProvider.tasks.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(taskProvider.tasks[index].title),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Icon(Icons.delete, color: Colors.white),
                        ),
                        onDismissed: (direction) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Row(
                                children: [
                                  Text('Task'),
                                  SizedBox(width: 5),
                                  Text(
                                    taskProvider.tasks[index].title,
                                    style: TextStyle(
                                      color: Colors.yellow,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  Text("Removed"),
                                ],
                              ),
                            ),
                          );
                          setState(() {
                            taskProvider.removeTask(index);
                          });
                        },
                        child: CheckboxListTile(
                          title: Text(taskProvider.tasks[index].title),
                          value: taskProvider.tasks[index].completed,
                          onChanged: (bool? value) {
                            // print(value);
                            setState(() {
                              if (value == true) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Row(
                                      children: [
                                        Text('Task'),
                                        SizedBox(width: 5),
                                        Text(
                                          taskProvider.tasks[index].title,
                                          style: TextStyle(
                                            color: Colors.yellow,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text("Completed"),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              taskProvider.tasks[index].completed =
                                  value ?? false;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
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
