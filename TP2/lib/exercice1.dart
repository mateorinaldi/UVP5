import 'package:flutter/material.dart';

class Exercise1Page extends StatelessWidget {
  const Exercise1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 1'),
      ),
      body: const Center(
        child: Image(
          image: NetworkImage('https://picsum.photos/512/1024'),
        )
      ),
    );
  }
}