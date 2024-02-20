import 'package:flutter/material.dart';

import 'exercice1.dart';
import 'exercice2.dart';
import 'exercice4.dart';


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
      return const DisplayImage();
    case 2:
      return const ChangeImageParameters();
    case 4:
      return const DisplayTileWidget();
    case 5:
      return const Exercise5Page();
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





class Exercise4Page extends StatelessWidget {
  const Exercise4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 4'),
      ),
      body: const Center(
        child: Column(
          children: [
            Image(
              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),

          ],
        ),
      ),
    );
  }
}


class Exercise5Page extends StatelessWidget {
  const Exercise5Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 5'),
      ),
      body: const Center(
        child: Text('Content for Exercice 5'),
      ),
    );
  }
}


class Exercise6Page extends StatelessWidget {
  const Exercise6Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 6'),
      ),
      body: const Center(
        child: Text('Content for Exercice 6'),
      ),
    );
  }
}