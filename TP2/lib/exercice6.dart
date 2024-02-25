import 'package:flutter/material.dart';
import 'dart:math' as math;

class Tile {
  Color color;

  Tile(this.color);
}

class TileWidget extends StatelessWidget {
  final Tile tile;
  final Function() onTap;
  final bool isMovable;

  TileWidget(this.tile, {required this.onTap, required this.isMovable});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: tile.color,
          border: Border.all(
            color: isMovable ? Colors.red : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text('tile i'),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: Exercise6Page()));

class Exercise6Page extends StatefulWidget {
  @override
  _Exercise6PageState createState() => _Exercise6PageState();
}

class _Exercise6PageState extends State<Exercise6Page> {
  List<Tile> tiles =
      List<Tile>.generate(9, (index) => Tile(Color.fromARGB(80, 80, 80, 80)));

  int emptyTileIndex = 0;
  int selectedTileIndex = -1;
  int gridSize = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Move Tiles'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Slider(
            value: gridSize.toDouble(),
            min: 2,
            max: 8,
            divisions: 7,
            onChanged: (value) {
              setState(() {
                gridSize = value.toInt();
                _initializeTiles();
              });
            },
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: gridSize,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: tiles.length,
              itemBuilder: (context, index) {
                return TileWidget(
                  tiles[index],
                  onTap: () => _handleTileTap(index),
                  isMovable: _isTileMovable(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _shuffleTiles,
        child: Icon(Icons.shuffle),
      ),
    );
  }

  void _initializeTiles() {
    setState(() {
      tiles = List<Tile>.generate(
          gridSize * gridSize, (index) => Tile(Colors.grey));
      tiles[0] = Tile(Colors.transparent); // Empty tile
      emptyTileIndex = 0;
      selectedTileIndex = -1;
    });
  }

  void _handleTileTap(int index) {
    setState(() {
      // Vérifier si la tuile sélectionnée est adjacente à la tuile vide
      if (_isTileMovable(index)) {
        // Échanger les positions de la tuile sélectionnée et de la tuile vide
        Tile temp = tiles[emptyTileIndex];
        tiles[emptyTileIndex] = tiles[index];
        tiles[index] = temp;
        emptyTileIndex = index;
      } else {
        // Sélectionner la tuile
        selectedTileIndex = index;
      }
    });
  }

  bool _isTileMovable(int index) {
    int rowDiff = (index ~/ gridSize) - (emptyTileIndex ~/ gridSize);
    int colDiff = (index % gridSize) - (emptyTileIndex % gridSize);
    return (rowDiff == 1 || rowDiff == -1) && colDiff == 0 ||
        (colDiff == 1 || colDiff == -1) && rowDiff == 0;
  }

  void _shuffleTiles() {
    setState(() {
      tiles.shuffle();
      emptyTileIndex =
          tiles.indexWhere((tile) => tile.color == Colors.transparent);
      selectedTileIndex = -1;
    });
  }
}
