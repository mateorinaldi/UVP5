import 'package:flutter/material.dart';

int size = 4;
String randomImageURL = 'https://picsum.photos/512';


class Tile {
  int ?tileNumber;
  Alignment alignment;
  Tile({required this.alignment, this.tileNumber});
}


class TileWidget extends StatefulWidget {
  final Tile tile;
  const TileWidget(this.tile, {super.key});

  @override
  State<TileWidget> createState() => _TileWidgetState();
}

class _TileWidgetState extends State<TileWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.tile.tileNumber);
      },
      child: tileBox()
    );
  }
  Widget tileBox() {
    return FittedBox(
      fit: BoxFit.fill,
      child: ClipRect(
        child: Align(
          alignment: widget.tile.alignment,
          widthFactor: 1/size,
          heightFactor: 1/size,
          child: Image.network(randomImageURL),
        ),
      ),
    );
  }
}



class Exercise5Page extends StatefulWidget {
  const Exercise5Page({super.key});

  @override
  State<Exercise5Page> createState() => _Exercise5PageState();
}


class _Exercise5PageState extends State<Exercise5Page> {
  late List<Tile> tiles; 

  @override
  void initState() {
    super.initState();
    tiles = createTiles(); // Initialisation de tiles dans initState
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    swapTiles();
  }


  List<Tile> createTiles() {
    List<Tile> tiles = [];
    for (int ordonnee = 0; ordonnee <= size-1; ordonnee++) {
      for (int abscisse = 0; abscisse <= size-1; abscisse++) {
        Alignment alignment = Alignment((2*abscisse)/(size-1)-1, (2*ordonnee)/(size-1)-1);
        
        int tileNumber = 4 * ordonnee + abscisse;
        tiles.add(Tile(alignment: alignment, tileNumber:tileNumber));
      }
    }
    return tiles;
  }


  Widget createTileWidgetFrom(Tile tile) {
    return InkWell(
      child: TileWidget(tile),
      onTap: () {
        print("tapped on tile ${tile.tileNumber}");
      },
    );
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
          return createTileWidgetFrom(tiles[index]);
        },
      ),
    );
    
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}