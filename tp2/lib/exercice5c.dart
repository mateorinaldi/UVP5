import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;
import 'dart:typed_data';

class Exercise5CPage extends StatefulWidget {
  const Exercise5CPage({Key? key}) : super(key: key);

  @override
  _Exercise5CPageState createState() => _Exercise5CPageState();
}

class _Exercise5CPageState extends State<Exercise5CPage> {
  double _numTiles = 3; // Nombre initial de tuiles (colonnes et lignes)
  late img.Image _image;

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
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display a Tile as a Cropped Image'),
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
                    });
                  },
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: _numTiles.toInt(), // Nombre de colonnes
                    crossAxisSpacing: 4.0, // Espace horizontal entre les tuiles
                    mainAxisSpacing: 4.0, // Espace vertical entre les tuiles
                    children: _buildTiles(),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  List<Widget> _buildTiles() {
    List<Widget> tiles = [];

    final tileWidth =
        _image.width ~/ _numTiles.toInt(); // Largeur de chaque tuile
    final tileHeight =
        _image.height ~/ _numTiles.toInt(); // Hauteur de chaque tuile

    // Ajouter les tuiles pour la grille
    for (int row = 0; row < _numTiles.toInt(); row++) {
      for (int col = 0; col < _numTiles.toInt(); col++) {
        final startX =
            col * tileWidth; // Position de départ en x pour la découpe
        final startY =
            row * tileHeight; // Position de départ en y pour la découpe
        final tileImage =
            img.copyCrop(_image, startX, startY, tileWidth, tileHeight);
        tiles.add(Tile(
            image: Image.memory(Uint8List.fromList(img.encodePng(tileImage)))));
      }
    }
    return tiles;
  }
}

class Tile extends StatelessWidget {
  final Image image;

  const Tile({required this.image});

  @override
  Widget build(BuildContext context) {
    return image;
  }
}
