import 'package:flutter/material.dart';

class Tile {
  Color color;

  Tile(this.color);
}

class TileWidget extends StatelessWidget {
  final Tile tile;
  final Function() onTap;
  final bool isMovable;
  final int index;

  TileWidget(this.tile,
      {required this.onTap, required this.isMovable, required this.index});

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
          child: Text('${index + 1}'),
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: MoveTiles()));

class MoveTiles extends StatefulWidget {
  @override
  _MoveTiles createState() => _MoveTiles();
}

class _MoveTiles extends State<MoveTiles> {
  List<Tile> tiles = [];
  int emptyTileIndex = 0;
  int selectedTileIndex = -1;
  int gridSize = 3;

  @override
  void initState() {
    super.initState();
    _initializeTiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Move Tiles'),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _initializeTiles() {
    setState(() {
      tiles = List<Tile>.generate(
          gridSize * gridSize, (index) => Tile(Colors.grey));
      tiles[0] = Tile(Colors.transparent);
      emptyTileIndex = 0;
      selectedTileIndex = -1;
    });
  }

  void _handleTileTap(int index) {
    setState(() {
      if (_isTileMovable(index)) {
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
}
