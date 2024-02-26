import 'dart:math';

import 'package:flutter/material.dart';


int size = 3;
List size_options = ['3x3', '4x4', '5x5', '6x6'];

String randomImageURL = 'https://picsum.photos/512';
Image randomImage = Image.network(
  randomImageURL,
  height: 300,
);

int freeTilePositionNumber = size*size-1;

class Exercise6Page extends StatefulWidget {
  const Exercise6Page({super.key});

  @override
  State<Exercise6Page> createState() => _Exercise6PageState();
}


class Tile {
  int? tileNumber;
  int? positionNumber;
  Alignment alignment;
  Image? image;
  Tile({required this.alignment, this.tileNumber, this.positionNumber, this.image});
}


class _Exercise6PageState extends State<Exercise6Page> {
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

        int tileNumber = size*ordonnee + abscisse;
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


  void updateSizeAndImageAndResetGrid(int newSize) {
    setState(() {
      randomImageURL = 'https://picsum.photos/512?random=${DateTime.now().millisecondsSinceEpoch}';
      randomImage = Image.network(
        randomImageURL,
        height: 300,
      );
      size = newSize;
      freeTilePositionNumber = size*size-1;
      tiles = createTiles();
    });
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
      // print(freeTilePositionNumber);
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
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
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
                    // print("tileNumber : ${tiles[index].tileNumber}");
                    // print("positionNumber : ${tiles[index].positionNumber}");
            
                    if (isSwapable(tiles[index].positionNumber!, freeTilePositionNumber)) {
                      swapTiles(tiles[index].positionNumber!);
                    }
                    else {
                      print("Pas échangeable");
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
          ),
          const SizedBox(height: 15,),

          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Choisissez la taille'),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(size_options.length, (index) {
                        return ListTile(
                          title: Text(size_options[index]),
                          onTap: () {
                            int tailleChoisie = index+3;
                            print('taille choisie: $tailleChoisie');
                            Navigator.of(context).pop(size_options[index]);
                            updateSizeAndImageAndResetGrid(tailleChoisie);
                          },
                        );
                      }),
                    ),
                  );
                },
              );
            }, 
            child: const Text('Nouvelle partie'),
          ),

          const SizedBox(height: 15,),
          randomImage,
          const SizedBox(height: 15,),
        ],
      ),
    );
  }
}