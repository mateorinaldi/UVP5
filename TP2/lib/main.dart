import 'package:flutter/material.dart';

import 'exercice1.dart';
import 'exercice2.dart';


class Todo {
  final String title;
  final int exerciseNumber;

  const Todo(this.title, this.exerciseNumber);
}

void main() {
  runApp(
    MaterialApp(
      title: 'Passing Data',
      home: TodosScreen(
        todos: List.generate(
          8,
          (i) => Todo(
            'Exercice ${i + 1}',
            i + 1,
          ),
        ),
      ),
    ),
  );
}

class TodosScreen extends StatelessWidget {
  const TodosScreen({super.key, required this.todos});

  final List<Todo> todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TP2 : Exercices'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => getExerciseClass(todos[index].exerciseNumber),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// Function to map exercise number to respective class
Widget getExerciseClass(int exerciseNumber) {
  switch (exerciseNumber) {
    case 1:
      return Exercise1Page();
    case 2:
      return Exercise2Page();
    case 3:
      return Exercise3Page();
    case 4:
      return Exercise4Page();
    // Add more cases for each exercise
    default:
      return Scaffold(
        appBar: AppBar(
          title: Text('Exercice $exerciseNumber'),
        ),
        body: Center(
          child: Text('Page for Exercice $exerciseNumber'),
        ),
      );
  }
}



class Exercise3Page extends StatelessWidget {
  const Exercise3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 3'),
      ),
      body: const Center(
        child: Text('Content for Exercice 3'),
      ),
    );
  }
}


class Exercise4Page extends StatelessWidget {
  const Exercise4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 4'),
      ),
      body: const Center(
        child: Text('Content for Exercice 4'),
      ),
    );
  }
}



