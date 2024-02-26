import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'dart:typed_data';
import 'dart:math';

class Exercise7Page extends StatefulWidget {
  const Exercise7Page({Key? key}) : super(key: key);

  @override
  _Exercise7PageState createState() => _Exercise7PageState();
}

class _Exercise7PageState extends State<Exercise7Page> {
  double _numTiles = 3; // Nombre initial de tuiles (colonnes et lignes)
  late img.Image? _image;
  late List<Widget> _tiles = []; // Liste pour stocker les images des tuiles
  late int _emptyTileIndex = 0; // Index de la tuile vide
  bool _gameStarted = false; // État du jeu

  @override
  void initState() {
    super.initState();
    _loadAndResizeImage();
  }

  Future<void> _loadAndResizeImage() async {
    final imageUrl = 'https://picsum.photos/512';
    final response = await http.get(Uri.parse(imageUrl));
    final imageBytes = response.bodyBytes;
    final image = img.decodeImage(imageBytes);
    setState(() {
      _image = image;
      _tiles = _buildTiles(image!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Taquin'),
        centerTitle: true,
      ),
      body: _image != null
          ? Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: !_gameStarted
                          ? () {
                              setState(() {
                                if (_numTiles > 2) _numTiles--;
                                _tiles = _buildTiles(_image!);
                              });
                            }
                          : null,
                      child: Icon(Icons.remove),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: !_gameStarted
                          ? () {
                              setState(() {
                                if (_numTiles < 10) _numTiles++;
                                _tiles = _buildTiles(_image!);
                              });
                            }
                          : null,
                      child: Icon(Icons.add),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: !_gameStarted ? _startGame : null,
                      child: Text(_gameStarted ? 'Started' : 'Start'),
                    ),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _numTiles.toInt(), // Nombre de colonnes
                      crossAxisSpacing:
                          4.0, // Espace horizontal entre les tuiles
                      mainAxisSpacing: 4.0, // Espace vertical entre les tuiles
                    ),
                    itemCount: _tiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          _handleTileTap(index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            border: _tiles[index] is EmptyTile
                                ? Border.all(color: Colors.transparent)
                                : _isTileMovable(index)
                                    ? Border.all(color: Colors.red, width: 2.0)
                                    : null,
                          ),
                          child: _tiles[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  List<Widget> _buildTiles(img.Image image) {
    List<Widget> tiles = [];

    final tileWidth =
        image.width ~/ _numTiles.toInt(); // Largeur de chaque tuile
    final tileHeight =
        image.height ~/ _numTiles.toInt(); // Hauteur de chaque tuile

    // Ajouter la tuile vide en haut à gauche
    tiles.add(EmptyTile());
    // Ajouter les autres tuiles pour la grille
    for (int row = 0; row < _numTiles.toInt(); row++) {
      for (int col = 0; col < _numTiles.toInt(); col++) {
        if (row == 0 && col == 0) continue; // Ignorer la tuile vide
        final startX =
            col * tileWidth; // Position de départ en x pour la découpe
        final startY =
            row * tileHeight; // Position de départ en y pour la découpe
        final tileImage =
            img.copyCrop(image, startX, startY, tileWidth, tileHeight);
        tiles.add(Tile(
          image: Image.memory(
            Uint8List.fromList(img.encodePng(tileImage)),
          ),
        ));
      }
    }

    return tiles;
  }

  void _startGame() {
    setState(() {
      _gameStarted = true;
      _shuffleTiles();
    });
  }

  void _shuffleTiles() {
    final random = Random();
    for (int i = 1; i < _tiles.length; i++) {
      final randomIndex =
          random.nextInt(_tiles.length - 1) + 1; // Ignorer la tuile vide
      final temp = _tiles[randomIndex];
      _tiles[randomIndex] = _tiles[i];
      _tiles[i] = temp;
      if (randomIndex == _emptyTileIndex)
        _emptyTileIndex = i; // Mettre à jour l'index de la tuile vide
    }
  }

  void _handleTileTap(int index) {
    // Vérifier si le jeu est en cours
    if (!_gameStarted) return;

    // Vérifier si la tuile cliquée est adjacente à la tuile vide
    if (_isTileMovable(index)) {
      setState(() {
        // Échanger les positions de la tuile cliquée et de la tuile vide
        final temp = _tiles[_emptyTileIndex];
        _tiles[_emptyTileIndex] = _tiles[index];
        _tiles[index] = temp;
        _emptyTileIndex = index;
      });
    }
  }

  bool _isTileMovable(int index) {
    final rowDiff =
        (index ~/ _numTiles.toInt()) - (_emptyTileIndex ~/ _numTiles.toInt());
    final colDiff =
        (index % _numTiles.toInt()) - (_emptyTileIndex % _numTiles.toInt());
    return (rowDiff == 1 || rowDiff == -1) && colDiff == 0 ||
        (colDiff == 1 || colDiff == -1) && rowDiff == 0;
  }
}

class Tile extends StatelessWidget {
  final Widget image;

  const Tile({required this.image});

  @override
  Widget build(BuildContext context) {
    return image;
  }
}

class EmptyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
    );
  }
}
