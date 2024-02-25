import 'dart:math';

import 'package:flutter/material.dart';
// import 'dart:math';

int size = 4;

String randomImageURL = 'https://picsum.photos/512';
Image randomImage = Image.network(randomImageURL);

int freeTilePositionNumber = size*size-1;

class Exercise5Page extends StatefulWidget {
  const Exercise5Page({super.key});

  @override
  State<Exercise5Page> createState() => _Exercise5PageState();
}


class Tile {
  int? tileNumber;
  int? positionNumber;
  Alignment alignment;
  Image? image;
  Tile({required this.alignment, this.tileNumber, this.positionNumber, this.image});
}


class _Exercise5PageState extends State<Exercise5Page> {
  late List<Tile> tiles;

  @override
  void initState() {
    super.initState();
    tiles = createTiles(); // Initialisation de tiles dans initState
  }


  List<Tile> createTiles() {
    List<Tile> tiles = [];
    for (int ordonnee=0; ordonnee <= size-1; ordonnee++) {
      for (int abscisse=0; abscisse <= size-1; abscisse++) {
        Alignment alignment = Alignment((2*abscisse)/(size-1)-1, (2*ordonnee)/(size-1)-1);

        int tileNumber = 4*ordonnee + abscisse;
        Image image = Image.network(randomImageURL);
        tiles.add(
          Tile(
            alignment: alignment,
            tileNumber: tileNumber,
            positionNumber: tileNumber,
            image: image,
          )
        );
      }
    }

    int lastTileNumber = tiles[tiles.length-1].positionNumber!;

    Image blueImage = Image.asset(
      'assets/images/blue_square.jpg',
    );

    tiles[lastTileNumber].image = blueImage;

    return tiles;
  }


  void swapTiles(int tileToMovePosition) {
    setState(() {
      final temp = tiles[freeTilePositionNumber];
      tiles[freeTilePositionNumber] = tiles[tileToMovePosition];
      tiles[tileToMovePosition] = temp;

      final temp2 = tiles[freeTilePositionNumber].positionNumber;
      tiles[freeTilePositionNumber].positionNumber = tiles[tileToMovePosition].positionNumber;
      tiles[tileToMovePosition].positionNumber = temp2;
      freeTilePositionNumber = temp2!;
      print(freeTilePositionNumber);
    });
  }


  bool isSwapable(int tilePosition1, int tilePosition2) {
    return ((tilePosition1-tilePosition2).abs() == 1 && max(tilePosition1, tilePosition2)%size != 0) || ((tilePosition1-tilePosition2).abs() == size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Display a Tile as a Cropped Image'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: size,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: tiles.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print("tileNumber : ${tiles[index].tileNumber}");
              print("positionNumber : ${tiles[index].positionNumber}");

              if (isSwapable(tiles[index].positionNumber!, freeTilePositionNumber)) {
                swapTiles(tiles[index].positionNumber!);
              }
            },
            child: FittedBox(
              fit: BoxFit.fill,
              child: ClipRect(
                child: Align(
                  alignment: tiles[index].alignment,
                  widthFactor: 1 / size,
                  heightFactor: 1 / size,
                  child: tiles[index].image,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}