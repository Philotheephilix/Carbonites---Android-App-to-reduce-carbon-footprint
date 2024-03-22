import 'package:flutter/material.dart';

class MyGoalsPage extends StatelessWidget {
  const MyGoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<String> _goals = [];

  void _addGoal(String goal) {
    setState(() {
      _goals.add(goal);
    });
  }

  void _removeGoal(int index) {
    setState(() {
      _goals.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Goals"),
      ),
      body: ListView.builder(
        itemCount: _goals.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(_goals[index]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _removeGoal(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddGoalDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddGoalDialog(BuildContext context) {
    String newGoal = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Goal'),
          content: TextField(
            onChanged: (value) {
              newGoal = value;
            },
            decoration: InputDecoration(hintText: 'Enter your goal'),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                _addGoal(newGoal);
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}
