import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image/image.dart' as img;

class Exercise5BPage extends StatelessWidget {
  const Exercise5BPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: FutureBuilder<img.Image>(
        future: _loadAndResizeImage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0, // Nombre de colonnes
              children: _buildTiles(snapshot.data!),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<img.Image> _loadAndResizeImage() async {
    final imageUrl = 'https://picsum.photos/512';
    final response = await http.get(Uri.parse(imageUrl));
    final imageBytes = response.bodyBytes;
    final image = img.decodeImage(imageBytes)!;
    return img.copyResize(image, width: 512, height: 512);
  }

  List<Widget> _buildTiles(img.Image image) {
    List<Widget> tiles = [];

    final tileWidth = image.width ~/ 3; // Largeur de chaque tuile
    final tileHeight = image.height ~/ 3; // Hauteur de chaque tuile

    // Ajouter 9 tuiles pour la grille 3x3
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        final startX =
            col * tileWidth; // Position de départ en x pour la découpe
        final startY =
            row * tileHeight; // Position de départ en y pour la découpe
        final tileImage =
            img.copyCrop(image, startX, startY, tileWidth, tileHeight);
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
