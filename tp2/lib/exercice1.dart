import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercice 1'),
      ),
      body: const Center(
          child: Image(
        image: NetworkImage('https://picsum.photos/512/1024'),
      )),
    );
  }
}
