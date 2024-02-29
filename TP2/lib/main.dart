import 'package:flutter/material.dart';
import 'package:tp2/exercice5b.dart';

import 'exercice1.dart';
import 'exercice2.dart';
import 'exercice4.dart';
import 'exercice5a.dart';
import 'exercice5b.dart';
import 'exercice5c.dart';
import 'exercice6.dart';
import 'exercice7.dart';

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
        todos: [
          Todo('Exo1 : Afficher une image', 1),
          Todo('Exo2 : Transformer une image', 2),
          Todo('Exo4 : Afficher une tuile', 3),
          Todo('Exo5a : Génération du plateau de tuiles simples', 4),
          Todo('Exo5b : Génération des tuiles avec image', 5),
          Todo('Exo5c : Génération des tuiles avec image et dimension grille',
              6),
          Todo('Exo6 : Déplacement des tuiles', 7),
          Todo('Exo7 : Jeu de taquin', 8),
        ],
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
                  builder: (context) =>
                      getExerciseClass(todos[index].exerciseNumber),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

Widget getExerciseClass(int exerciseNumber) {
  switch (exerciseNumber) {
    case 1:
      return const DisplayImage();
    case 2:
      return const ChangeImageParameters();
    case 3:
      return const DisplayTileWidget();
    case 4:
      return const Exercise5APage();
    case 5:
      return const Exercise5BPage();
    case 6:
      return const Exercise5CPage();
    case 7:
      return MoveTiles();
    case 8:
      return Exercise6Page();
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
