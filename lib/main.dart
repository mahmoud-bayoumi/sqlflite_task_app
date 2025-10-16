import 'package:flutter/material.dart';

import 'db_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLite To-Do',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Map<String, dynamic>> _todos = [];

  void _refreshTodos() async {
    final data = await DBHelper.getTodos();
    setState(() {
      _todos = data;
    });
  }

  void _deleteTodo(int id) async {
    await DBHelper.deleteTodo(id);
    _refreshTodos();
  }

  void _showAddTodoDialog() {
    final TextEditingController dialogController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Add New To-Do'),
        content: TextField(
          controller: dialogController,
          autofocus: true,
          decoration: InputDecoration(hintText: 'Enter task'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
            },
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              final text = dialogController.text.trim();
              if (text.isNotEmpty) {
                await DBHelper.insertTodo(text);
                Navigator.pop(context);
                _refreshTodos();
              }
            },
            child: Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _refreshTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SQLite To-Do')),
      body: _todos.isEmpty
          ? Center(child: Text('No to-dos yet. Tap + to add one.'))
          : ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return ListTile(
                  title: Text(todo['title']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteTodo(todo['id']),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        tooltip: 'Add To-Do',
        child: Icon(Icons.add),
      ),
    );
  }
}
