import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'medias.dart';

void main() {
  runApp(MyApp());
}

class SearchByTypePage extends StatefulWidget {
  final List<Media> medias;

  SearchByTypePage({required this.medias});

  @override
  // ignore: library_private_types_in_public_api
  _SearchByTypePageState createState() => _SearchByTypePageState();
}

class _SearchByTypePageState extends State<SearchByTypePage> {
  String? selectedType;
  late List<Media> filteredMedias;

  @override
  void initState() {
    super.initState();
    filteredMedias = widget.medias;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rechercher par type de média'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField<String>(
              value: selectedType,
              hint: Text('Sélectionner un type de média'),
              onChanged: (value) {
                setState(() {
                  selectedType = value;
                  filteredMedias = widget.medias
                      .where((media) => media.categorie == selectedType)
                      .toList();
                });
              },
              items: _getUniqueCategories(widget.medias)
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredMedias.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(filteredMedias[index].nom),
                  subtitle: Text(filteredMedias[index].categorie),
                  leading: Image.asset(
                    filteredMedias[index].image,
                    width: 100,
                    height: 80,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            MovieDetailPage(media: filteredMedias[index]),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<String> _getUniqueCategories(List<Media> medias) {
    Set<String> categories = {};
    medias.forEach((media) {
      categories.add(media.categorie);
    });
    return categories.toList();
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      title: 'Liste de Films',
      initialRoute: '/',
      routes: {
        '/': (context) => Scaffold(
              appBar: AppBar(
                title: Text('Medias'),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 122, 7, 26),
                      ),
                      child: Text(
                        'Menu',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Voir les favoris'),
                      onTap: () {
                        Navigator.pop(context); // Ferme le drawer
                        Navigator.pushNamed(context, '/favorites');
                      },
                    ),
                    ListTile(
                      title: Text('Rechercher par type de media'),
                      onTap: () {
                        Navigator.pop(context); // Ferme le drawer
                        Navigator.pushNamed(context, '/search_by_type');
                      },
                    ),
                  ],
                ),
              ),
              body: ListView.builder(
                itemCount: medias.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(medias[index].nom),
                    subtitle: Text(medias[index].categorie),
                    leading: Image.asset(
                      medias[index].image,
                      width: 150,
                      height: 200,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MovieDetailPage(media: medias[index]),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
        '/favorites': (context) => FavoriteMoviesPage(medias: medias),
        '/search_by_type': (context) => SearchByTypePage(medias: medias),
      },
    );
  }
}

class MovieDetailPage extends StatefulWidget {
  final Media media;

  MovieDetailPage({required this.media});

  @override
  // ignore: library_private_types_in_public_api
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.media.favorite;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.media.nom),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  widget.media.image,
                  width: 150,
                  height: 200,
                ),
                SizedBox(width: 10),
                Flexible(child: Text('Description: ${widget.media.description}')),
              ],
            ),
            SizedBox(height: 20),
            Text('Genre: ${widget.media.categorie}'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isFavorite = !isFavorite;
                  widget.media.favorite = isFavorite;
                });
              },
              child: Text(
                isFavorite ? 'Retirer des favoris' : 'Ajouter aux favoris',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteMoviesPage extends StatelessWidget {
  final List<Media> medias;

  FavoriteMoviesPage({required this.medias});

  @override
  Widget build(BuildContext context) {
    final favoriteMedias = medias.where((media) => media.favorite).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favoris'),
      ),
      body: ListView.builder(
        itemCount: favoriteMedias.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(favoriteMedias[index].nom),
            subtitle: Text(favoriteMedias[index].categorie),
            leading: Image.asset(
              favoriteMedias[index].image,
              width: 150,
              height: 200,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MovieDetailPage(media: favoriteMedias[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
