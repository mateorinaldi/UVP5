import 'package:flutter/material.dart';

class Tile {
  String imageURL;
  Alignment alignment;

  Tile({required this.imageURL, required this.alignment});

  Widget croppedImageTile() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: alignment,
          widthFactor: 0.2,
          heightFactor: 0.2,
          child: Image.network(imageURL),
        ),
      ),
    );
  }
}

Tile tile = Tile(
    imageURL: 'https://picsum.photos/512', alignment: const Alignment(1, 1));

class Exercise5APage extends StatelessWidget {
  const Exercise5APage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gridview example'),
        centerTitle: true,
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: List.generate(9, (index) {
          return Container(
            margin: EdgeInsets.all(4),
            color: Colors.grey,
            child: Center(
              child: Text(
                'Container §index',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }),
      ),
    );
  }
  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(children: [
        SizedBox(
            width: 150.0,
            height: 150.0,
            child: Container(
                margin: const EdgeInsets.all(20.0),
                child: createTileWidgetFrom(tile))),
        SizedBox(
            height: 200,
            child: Image.network('https://picsum.photos/512',
                fit: BoxFit.cover))
      ])),
    );*/
}

Widget createTileWidgetFrom(Tile tile) {
  return InkWell(
    child: tile.croppedImageTile(),
    onTap: () {
      print("tapped on tile");
    },
  );
}
