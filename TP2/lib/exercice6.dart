import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

int defaultSize = 3;

int size = defaultSize;
List sizeOptions = ['3x3', '4x4', '5x5', '6x6'];

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
    createTiles();
    mixTiles();
  }


  createTiles() {
    tiles = [];
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
  }

  mixTiles() {
    int numberOfTiles = tiles.length;
    List<Tile> mixedTilesList = tiles;
    mixedTilesList.shuffle();
    tiles = mixedTilesList;
    List<int?> positions = tiles.map((tile) => tile.tileNumber).toList();
    
    for (int positionInd=0; positionInd < numberOfTiles; positionInd++) {
      tiles[positionInd].positionNumber = positionInd;
    }
    freeTilePositionNumber = positions.indexOf(size*size-1);

    bool pariteCaseVide;
    bool pariteTuiles;

    int ligneFreeTile = freeTilePositionNumber~/size+1;
    int colonneFreeTile = freeTilePositionNumber%size+1;

    int diffLigne = size-ligneFreeTile;
    int diffColonne = size-colonneFreeTile;

    pariteCaseVide = (diffColonne+diffLigne)%2 == 0;

    int nombrePermutationsTuiles = 0;
    for (int i=0; i < numberOfTiles; i++) {
      int indexEltI = positions.indexOf(i);
      if (indexEltI != i) {
        int? temp = positions[i];
        positions[i] = positions[indexEltI];
        positions[indexEltI] = temp;
        nombrePermutationsTuiles++;
      }
    }
    pariteTuiles = nombrePermutationsTuiles%2 == 0;
    if (pariteTuiles!=pariteCaseVide) { // Si le taquin n'est pas solvable
      swapTiles(0, 1); // On échange 2 tuiles au hasard
      print("echange effectué");
    }
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
      createTiles();
      mixTiles();
    });
  }


  void swapTiles(int tile1, int tile2) {
    setState(() {
      final temp = tiles[tile2];
      tiles[tile2] = tiles[tile1];
      tiles[tile1] = temp;

      final temp2 = tiles[tile2].positionNumber;
      tiles[tile2].positionNumber = tiles[tile1].positionNumber;
      tiles[tile1].positionNumber = temp2;
    });
  }


  bool isSwapable(int tilePosition1, int tilePosition2) {
    return ((tilePosition1-tilePosition2).abs() == 1 && max(tilePosition1, tilePosition2)%size != 0) || ((tilePosition1-tilePosition2).abs() == size);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Taquin amélioré'),
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
                      swapTiles(tiles[index].positionNumber!, freeTilePositionNumber);
                      freeTilePositionNumber = tiles[index].positionNumber!;
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

          boutonNouvellePartie(context),

          const SizedBox(height: 15,),
          randomImage,
          const SizedBox(height: 15,),
        ],
      ),
    );
  }

  ElevatedButton boutonNouvellePartie(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Choisissez la taille'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(sizeOptions.length, (index) {
                  return ListTile(
                    title: Text(sizeOptions[index]),
                    onTap: () {
                      int tailleChoisie = index+3;
                      print('taille choisie: $tailleChoisie');
                      Navigator.of(context).pop(sizeOptions[index]);
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
    );
  }
}