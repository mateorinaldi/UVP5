import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'dart:typed_data';

class Exercise7Page extends StatefulWidget {
  const Exercise7Page({Key? key}) : super(key: key);

  @override
  _Exercise7PageState createState() => _Exercise7PageState();
}

class _Exercise7PageState extends State<Exercise7Page> {
  double _numTiles = 3; // Nombre initial de tuiles (colonnes et lignes)
  late img.Image _image;
  late List<Image?> _tiles; // Liste pour stocker les images des tuiles
  late int _emptyTileIndex; // Index de la tuile vide

  @override
  void initState() {
    super.initState();
    _loadAndResizeImage();
  }

  Future<void> _loadAndResizeImage() async {
    final imageUrl = 'https://picsum.photos/512';
    final response = await http.get(Uri.parse(imageUrl));
    final imageBytes = response.bodyBytes;
    final image = img.decodeImage(imageBytes)!;
    setState(() {
      _image = img.copyResize(image, width: 512, height: 512);
      _tiles = _buildTiles(_image);
      _emptyTileIndex =
          0; // L'index de la tuile vide est initialisé à la première tuile
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
                Slider(
                  value: _numTiles,
                  min: 2,
                  max: 10,
                  onChanged: (value) {
                    setState(() {
                      _numTiles = value;
                      _tiles = _buildTiles(_image);
                    });
                  },
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
                            border: _isTileMovable(index)
                                ? Border.all(color: Colors.red, width: 2.0)
                                : null,
                          ),
                          child: _tiles[index]!,
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

  List<Image?> _buildTiles(img.Image image) {
    List<Image?> tiles = [];

    final tileWidth =
        image.width ~/ _numTiles.toInt(); // Largeur de chaque tuile
    final tileHeight =
        image.height ~/ _numTiles.toInt(); // Hauteur de chaque tuile

    // Ajouter les tuiles pour la grille
    for (int row = 0; row < _numTiles.toInt(); row++) {
      for (int col = 0; col < _numTiles.toInt(); col++) {
        final startX =
            col * tileWidth; // Position de départ en x pour la découpe
        final startY =
            row * tileHeight; // Position de départ en y pour la découpe
        final tileImage =
            img.copyCrop(image, startX, startY, tileWidth, tileHeight);
        tiles.add(Image.memory(Uint8List.fromList(img.encodePng(tileImage))));
      }
    }
    return tiles;
  }

  void _handleTileTap(int index) {
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
