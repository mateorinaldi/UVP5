import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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

class Media {
  final String nom;
  final String categorie;
  final String image;
  final String description;
  bool favorite;

  Media({
    required this.nom,
    required this.categorie,
    required this.image,
    required this.description,
    this.favorite = false,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      nom: json['nom'],
      categorie: json['categorie'],
      image: json['image'],
      description: json['description'],
    );
  }
}

class MyApp extends StatelessWidget {
  final List<Media> medias = [
    Media(
      nom: "Harry Potter 1",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter1.webp',
      description: "zehjkgbzejjjjjjjjjjjjjjjjjjjjjjjjjcoifnzeroruignenzuirhigfjzouigvhfiazpezouibgvhofaejzebuihgvofajzeiughefiojasbuogfjiesviruegozjpeko"
    ),
    Media(
      nom: "Harry Potter 2",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter2.jpg',
      description: ""
    ),
    Media(
      nom: "Harry Potter 3",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter3.jpg',
      description: ""
    ),
    Media(
      nom: "Harry Potter 4",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter4.jpeg',
      description: ""
    ),
    Media(
      nom: "Harry Potter 5",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter5.jpg',
      description: ""
    ),
    Media(
      nom: "Harry Potter 6",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter6.jpg',
      description: ""
    ),
    Media(
      nom: "Harry Potter 7 partie 1",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter7_1.webp',
      description: ""
    ),
    Media(
      nom: "Harry Potter 7 partie 2",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter7_2.jpg',
      description: ""
    ),
    Media(
      nom: 'Le sang et l`acier',
      categorie: 'Livre',
      image: 'assets/imgs/lesangetlacier.jpg',
      description: ""
    ),
    Media(
      nom: "Game of Thrones",
      categorie: "Série",
      image: 'assets/imgs/got.jpg',
      description: ""
    ),
    Media(
      nom: "Crescent City 1",
      categorie: "Livre",
      image: 'assets/imgs/crescentcity1.jpg',
      description: ""
    ),
    Media(
      nom: "Crescent City 2",
      categorie: "Livre",
      image: 'assets/imgs/crescentcity2.jpg',
      description: ""
    ),
    Media(
      nom: "Crescent City 3",
      categorie: "Livre",
      image: 'assets/imgs/crescentcity3.jpg',
      description: ""
    ),
    Media(
      nom: "The Witcher 1",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher1.jpg',
      description: ""
    ),
    Media(
      nom: "The Witcher 2",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher2.webp',
      description: ""
    ),
    Media(
      nom: "The Witcher 3",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher3.jpg',
      description: ""
    ),
    Media(
      nom: "The Witcher 4",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher4.jpg',
      description: ""
    ),
    Media(
      nom: "The Witcher 5",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher5.jpg',
      description: ""
    ),
    Media(
      nom: "The Witcher 6",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher6.jpg',
      description: ""
    ),
    Media(
      nom: "The Witcher 7",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher7.jpg',
      description: ""
    ),
    Media(
      nom: "Breaking Bad",
      categorie: "Série",
      image: 'assets/imgs/breaking_bad.webp',
      description: ""
    ),
    Media(
      nom: "Twin Peaks",
      categorie: "Série",
      image: 'assets/imgs/twin_peaks.jpg',
      description: ""
    ),
    Media(
      nom: "Kaamelott",
      categorie: "Série",
      image: 'assets/imgs/kaamelott.jpg',
      description: ""
    ),
    Media(
      nom: "Dexter",
      categorie: "Série",
      image: 'assets/imgs/dexter.jpg',
      description: ""
    ),
    Media(
      nom: "Friends",
      categorie: "Série",
      image: 'assets/imgs/friends.png',
      description: ""
    ),
    Media(
      nom: "The Walking Dead",
      categorie: "Série",
      image: 'assets/imgs/the_walking_dead.jpg',
      description: ""
    ),
    Media(
      nom: "Black Mirror",
      categorie: "Série",
      image: 'assets/imgs/black_mirror.webp',
      description: ""
    ),
    Media(
      nom: "Doctor Who",
      categorie: "Série",
      image: 'assets/imgs/doctor_who.jpg',
      description: ""
    ),
    Media(
      nom: "The Big Bang Theory",
      categorie: "Série",
      image: 'assets/imgs/the_big_bang_theory.jpg',
      description: ""
    ),
    Media(
      nom: "Peaky Blinders",
      categorie: "Série",
      image: 'assets/imgs/peaky_blinders.webp',
      description: ""
    ),
    Media(
      nom: "Dr House",
      categorie: "Série",
      image: 'assets/imgs/dr_house.webp',
      description: ""
    ),
    Media(
      nom: "Stranger Things",
      categorie: "Série",
      image: 'assets/imgs/stranger_things.webp',
      description: ""
    ),
    Media(
      nom: "Better Call Saul",
      categorie: "Série",
      image: 'assets/imgs/better_call_saul.webp',
      description: ""
    ),
    Media(
      nom: "The Boys",
      categorie: "Série",
      image: 'assets/imgs/the_boys.webp',
      description: ""
    ),
    Media(
      nom: "Seigneur des anneaux 1",
      categorie: "Film",
      image: 'assets/imgs/seigneurdesanneaux1.jpg',
      description: ""
    ),
    Media(
      nom: "Seigneur des anneaux 2",
      categorie: "Film",
      image: 'assets/imgs/seigneurdesanneaux2.jpg',
      description: ""
    ),
    Media(
      nom: "Seigneur des anneaux 3",
      categorie: "Film",
      image: 'assets/imgs/seigneurdesanneaux3.jpg',
      description: ""
    ),
    Media(
      nom: "Inception",
      categorie: "Film",
      image: 'assets/imgs/inception.jpg',
      description: ""
    ),
    Media(
      nom: "Le parrain",
      categorie: "Film",
      image: 'assets/imgs/le_parrain.webp',
      description: ""
    ),
    Media(
      nom: "Forrest Gump",
      categorie: "Film",
      image: 'assets/imgs/forrest_gump.webp',
      description: ""
    ),
    Media(
      nom: "Django Unchained",
      categorie: "Film",
      image: 'assets/imgs/django_unchained.jpg',
      description: ""
    ),
    Media(
      nom: "Reservoir Dogs",
      categorie: "Film",
      image: 'assets/imgs/reservoir_dogs.webp',
      description: ""
    ),
    Media(
      nom: "Pulp Fiction",
      categorie: "Film",
      image: 'assets/imgs/pulp_fiction.jpg',
      description: ""
    ),
    Media(
      nom: "Le Grand Bleu",
      categorie: "Film",
      image: 'assets/imgs/le_grand_bleu.webp',
      description: ""
    ),
    Media(
      nom: "Fight Club",
      categorie: "Film",
      image: 'assets/imgs/fight_club.jpg',
      description: ""
    ),
    Media(
      nom: "La ligne verte",
      categorie: "Film",
      image: 'assets/imgs/la_ligne_verte.jpg',
      description: ""
    ),
    Media(
      nom: "Gladiator",
      categorie: "Film",
      image: 'assets/imgs/gladiator.jpg',
      description: ""
    ),
    Media(
      nom: "1984",
      categorie: "Livre",
      image: 'assets/imgs/1984.webp',
      description: ""
    ),
    Media(
      nom: "Le Petit Prince",
      categorie: "Livre",
      image: 'assets/imgs/le_petit_prince.jpg',
      description: ""
    ),
    Media(
      nom: "Dune",
      categorie: "Livre",
      image: 'assets/imgs/dune.webp',
      description: ""
    ),
    Media(
      nom: "Le Petit Prince",
      categorie: "Livre",
      image: 'assets/imgs/le_petit_prince.jpg',
      description: ""
    ),
    Media(
      nom: "Le Parfum",
      categorie: "Livre",
      image: 'assets/imgs/le_parfum.jpg',
      description: ""
    ),
    Media(
      nom: "Cyrano de Bergerac",
      categorie: "Livre",
      image: 'assets/imgs/cyrano_de_bergerac.webp',
      description: ""
    ),
    Media(
      nom: "Dix Petits Nègres",
      categorie: "Livre",
      image: 'assets/imgs/dix_petits_negres.jpg',
      description: ""
    ),
    Media(
      nom: "Le Meilleur des Mondes",
      categorie: "Livre",
      image: 'assets/imgs/le_meilleur_des_mondes.webp',
      description: ""
    ),
    Media(
      nom: "Des souris et des hommes",
      categorie: "Livre",
      image: 'assets/imgs/des_souris_et_des_hommes.jpg',
      description: ""
    ),
    Media(
      nom: "Bilbo le Hobbit",
      categorie: "Livre",
      image: 'assets/imgs/bilbo_le_hobbit.jpg',
      description: ""
    ),
    Media(
      nom: "Fahrenheit 451",
      categorie: "Livre",
      image: 'assets/imgs/fahrenheit_451.png',
      description: ""
    ),
    Media(
      nom: "Hypérion",
      categorie: "Livre",
      image: 'assets/imgs/hyperion.jpg',
      description: ""
    ),
    Media(
      nom: "Antigone",
      categorie: "Livre",
      image: 'assets/imgs/antigone.webp',
      description: ""
    ),
    Media(
      nom: "Dracula",
      categorie: "Livre",
      image: 'assets/imgs/dracula.jpg',
      description: ""
    ),
    Media(
      nom: "La Constance du prédateur",
      categorie: "Livre",
      image: 'assets/imgs/la_constance_du_predateur.jpeg',
      description: ""
    ),
    Media(
      nom: "Le Signal",
      categorie: "Livre",
      image: 'assets/imgs/le_signal.jpeg',
      description: ""
    ),
    Media(
      nom: "Prédateurs",
      categorie: "Livre",
      image: 'assets/imgs/predateurs.jpg',
      description: ""
    ),
    Media(
      nom: "Léviatemps",
      categorie: "Livre",
      image: 'assets/imgs/leviatemps.jpg',
      description: ""
    )
  ];

  @override
  Widget build(BuildContext context) {
    // Future<List<Media>> readJsonFile(String filePath) async {
    //   var input = await File(filePath).readAsString();
    //   var map = jsonDecode(input);

    //   List<Map<String, dynamic>> mediaMaps = List<Map<String, dynamic>>.from(map['medias']);
    //   return mediaMaps.map((mediaMap) => Media.fromJson(mediaMap)).toList();
    // }
  
  
    // final List<Media> medias = readJsonFile("medias.json") as List<Media>;

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
