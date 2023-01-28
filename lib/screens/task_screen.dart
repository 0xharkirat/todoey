import 'package:flutter/material.dart';
import 'package:todoey/screens/add_task_screen.dart';
import 'package:todoey/widgets/tasks_list.dart';
import 'package:todoey/models/task.dart';


class TasksScreen extends StatefulWidget {

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) => AddTaskScreen(
                                    addTaskCallback: (newTaskTitle){
                                      setState(() {
                                        tasks.add(Task(name: newTaskTitle!));
                                      });
                                      Navigator.pop(context);

                                    },

            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                topLeft: Radius.circular(20.0),
              ),
            ),
          );
        },
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(
          Icons.add,
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            Container(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:  <Widget> [
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundColor: Colors.white,
                    child: Icon(
                      Icons.list,
                      size: 30.0,
                      color: Colors.lightBlueAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    'Todoey',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.w700,

                    ),
                  ),
                  Text(
                    '${tasks.length} Tasks',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),


                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
                ),
                child: TasksList(tasks),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




