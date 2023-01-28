import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {

  final Function(String?)? addTaskCallback;

  AddTaskScreen({required this.addTaskCallback});

  String? newTaskTitle;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  <Widget> [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
             TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value){
                newTaskTitle = value;
              },

            ),
            TextButton(
              onPressed: (){

                addTaskCallback!(newTaskTitle);

              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.lightBlueAccent,
              ),
              child: const Text("Add"),
            )


          ],
        ),
      ),
    );
  }
}
