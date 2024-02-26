import 'dart:math';

import 'package:flutter/material.dart';

int defaultSize = 2;
int moveCounter = 0;
late int startingTime;

int size = defaultSize;
List sizeOptions = ['2x2', '3x3', '4x4', '5x5', '6x6'];

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
    startingTime = DateTime.now().millisecondsSinceEpoch;
    createTiles();
    mixTiles();
  }


  void createTiles() {
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
      'assets/images/white_square.jpg',
    );

    tiles[lastTileNumber].image = blueImage;
  }

  void mixTiles() {
    int numberOfTiles = tiles.length;
    tiles.shuffle();
    List<int?> positions = tiles.map((tile) => tile.tileNumber).toList();
    
    for (int positionInd=0; positionInd < numberOfTiles; positionInd++) {
      tiles[positionInd].positionNumber = positionInd;
    }

    print(freeTilePositionNumber);

    freeTilePositionNumber = positions.indexOf(size*size-1);
    print(freeTilePositionNumber);

    changeParityIfNecessary(numberOfTiles, positions);
  }

  void changeParityIfNecessary(int numberOfTiles, List<int?> positions) {
    print(positions);
    bool pariteCaseVide;
    bool pariteTuiles;
    
    int ligneFreeTile = freeTilePositionNumber~/size+1;
    int colonneFreeTile = freeTilePositionNumber%size+1;
    
    int diffLigne = size-ligneFreeTile;
    int diffColonne = size-colonneFreeTile;
    
    pariteCaseVide = (diffColonne+diffLigne)%2 == 0;
    print(pariteCaseVide);

    int nombrePermutationsTuiles = 0;
    for (int i=0; i < numberOfTiles; i++) {
      int indexEltI = positions.indexOf(i);
      if (indexEltI != i) {
        int temp = positions[i]!;
        positions[i] = positions[indexEltI];
        positions[indexEltI] = temp;
        nombrePermutationsTuiles++;
      }
    }

    pariteTuiles = nombrePermutationsTuiles%2 == 0;
    print(pariteTuiles);

    if (pariteTuiles!=pariteCaseVide) { // Si le taquin n'est pas solvable
      if (freeTilePositionNumber!=0 && freeTilePositionNumber!=1) {
        swapTiles(0, 1); // On échange 2 tuiles (ne marche pas si contient la tuile vide)
      }
      else {
        swapTiles(numberOfTiles-2, numberOfTiles-1); // On échange 2 tuiles qui ne sont pas vides
      }
      
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
      moveCounter = 0;
      freeTilePositionNumber = size*size-1;
      startingTime = DateTime.now().millisecondsSinceEpoch;
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

      if (tiles[tile1].tileNumber==size*size-1) {
        freeTilePositionNumber = tile1;
      }
      if (tiles[tile2].tileNumber==size*size-1) {
        freeTilePositionNumber = tile2;
      }
    });
  }

  
  void addToCounter() {
    moveCounter++;
    // print(moveCounter);
  }

  
  bool isGameWone() {
    for (int i=0; i < tiles.length; i++) {
      if (tiles[i].tileNumber!=i) {
        return false;
      }
    }
    return true;
  }


  bool isSwapable(int tilePosition1, int tilePosition2) {
    return ((tilePosition1-tilePosition2).abs() == 1 
    && max(tilePosition1, tilePosition2)%size != 0) 
    || ((tilePosition1-tilePosition2).abs() == size);
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
                return clickableTile(index, context);
              },
            ),
          ),
          const SizedBox(height: 15,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Nombre de coups : $moveCounter"),
              const SizedBox(width: 15,),
              boutonNouvellePartie(context),
            ],
          ),

          const SizedBox(height: 15,),
          randomImage,
          const SizedBox(height: 15,),
        ],
      ),
    );
  }

  InkWell clickableTile(int index, BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSwapable(tiles[index].positionNumber!, freeTilePositionNumber)) {
          swapTiles(tiles[index].positionNumber!, freeTilePositionNumber);
          addToCounter();
          if (isGameWone()) {
            // print("c'est gagné");
            int currentTime = DateTime.now().millisecondsSinceEpoch;
            int tempsTotal = (currentTime - startingTime)~/1000;
            victoryPopup(context, tempsTotal);
          }
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
  }


  void victoryPopup(BuildContext context, int tempsTotal) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bravo, vous avez gagné en $tempsTotal secondes et $moveCounter coups !!'),
        );
      },
    );
  }


  ElevatedButton boutonNouvellePartie(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return sizeChoicePopup(context);
          },
        );
      }, 
      child: const Text('Nouvelle partie'),
    );
  }


  AlertDialog sizeChoicePopup(BuildContext context) {
    return AlertDialog(
      title: const Text('Choisissez la taille'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(sizeOptions.length, (index) {
          return ListTile(
            title: Text(sizeOptions[index]),
            onTap: () {
              int tailleChoisie = index+2;
              // print('taille choisie: $tailleChoisie');
              Navigator.of(context).pop(sizeOptions[index]);
              updateSizeAndImageAndResetGrid(tailleChoisie);
            },
          );
        }),
      ),
    );
  }
}