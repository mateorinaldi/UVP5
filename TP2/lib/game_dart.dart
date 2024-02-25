import 'package:flutter/material.dart';

class GameBoard extends StatelessWidget {
  const GameBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 9,
      itemBuilder: (context, index) {
        return Tile(imageIndex: index);
      },
    );
  }
}

class Tile extends StatelessWidget {
  final int imageIndex;

  const Tile({required this.imageIndex});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://picsum.photos/512',
      fit: BoxFit.fill,
      alignment: _calculateAlignment(imageIndex),
    );
  }

  Alignment _calculateAlignment(int index) {
    int rows = 3;
    int cols = 3;

    int rowIndex = index ~/ cols;
    int colIndex = index % cols;

    double dx = colIndex / cols;
    double dy = rowIndex / rows;

    return Alignment(-dx, -dy);
  }
}
