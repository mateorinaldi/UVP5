import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class SearchByTypePage extends StatefulWidget {
  final List<Media> medias;

  SearchByTypePage({required this.medias});

  @override
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
    Set<String> categories = Set();
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
  bool favorite;

  Media({
    required this.nom,
    required this.categorie,
    required this.image,
    this.favorite = false,
  });
}
/*class Media {
  final String nom;
  final String categorie;
  final String image;
  bool favorite;

  Media({
    required this.nom,
    required this.categorie,
    required this.image,
    this.favorite = false,
  });
}*/

class MyApp extends StatelessWidget {
  final List<Media> medias = [
    Media(
      nom: "Harry Potter 1",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter1.webp',
    ),
    Media(
      nom: "Harry Potter 2",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter2.jpg',
    ),
    Media(
      nom: "Harry Potter 3",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter3.jpg',
    ),
    Media(
      nom: "Harry Potter 4",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter4.jpeg',
    ),
    Media(
      nom: "Harry Potter 5",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter5.jpg',
    ),
    Media(
      nom: "Harry Potter 6",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter6.jpg',
    ),
    Media(
      nom: "Harry Potter 7 partie 1",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter7_1.webp',
    ),
    Media(
      nom: "Harry Potter 7 partie 2",
      categorie: 'Film',
      image: 'assets/imgs/harrypotter7_2.jpg',
    ),
    Media(
      nom: 'Le sang et l`acier',
      categorie: 'Livre',
      image: 'assets/imgs/lesangetlacier.jpg',
    ),
    Media(
      nom: "Game of Thrones",
      categorie: "Série",
      image: 'assets/imgs/got.jpg',
    ),
    Media(
      nom: "Crescent City 1",
      categorie: "Livre",
      image: 'assets/imgs/crescentcity1.jpg',
    ),
    Media(
      nom: "Crescent City 2",
      categorie: "Livre",
      image: 'assets/imgs/crescentcity2.jpg',
    ),
    Media(
      nom: "Crescent City 3",
      categorie: "Livre",
      image: 'assets/imgs/crescentcity3.jpg',
    ),
    Media(
      nom: "The Witcher 1",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher1.jpg',
    ),
    Media(
      nom: "The Witcher 2",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher2.webp',
    ),
    Media(
      nom: "The Witcher 3",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher3.jpg',
    ),
    Media(
      nom: "The Witcher 4",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher4.jpg',
    ),
    Media(
      nom: "The Witcher 5",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher5.jpg',
    ),
    Media(
      nom: "The Witcher 6",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher6.jpg',
    ),
    Media(
      nom: "The Witcher 7",
      categorie: "Livre",
      image: 'assets/imgs/thewitcher7.jpg',
    ),
    Media(
      nom: "Breaking Bad",
      categorie: "Série",
      image: 'assets/imgs/breaking_bad.webp',
    ),
    Media(
      nom: "Twin Peaks",
      categorie: "Série",
      image: 'assets/imgs/twin_peaks.jpg',
    ),
    Media(
      nom: "Kaamelott",
      categorie: "Série",
      image: 'assets/imgs/kaamelott.jpg',
    ),
    Media(
      nom: "Dexter",
      categorie: "Série",
      image: 'assets/imgs/dexter.jpg',
    ),
    Media(
      nom: "Friends",
      categorie: "Série",
      image: 'assets/imgs/friends.png',
    ),
    Media(
      nom: "The Walking Dead",
      categorie: "Série",
      image: 'assets/imgs/the_walking_dead.jpg',
    ),
    Media(
      nom: "Black Mirror",
      categorie: "Série",
      image: 'assets/imgs/black_mirror.webp',
    ),
    Media(
      nom: "Doctor Who",
      categorie: "Série",
      image: 'assets/imgs/doctor_who.jpg',
    ),
    Media(
      nom: "The Big Bang Theory",
      categorie: "Série",
      image: 'assets/imgs/the_big_bang_theory.jpg',
    ),
    Media(
      nom: "Peaky Blinders",
      categorie: "Série",
      image: 'assets/imgs/peaky_blinders.webp',
    ),
    Media(
      nom: "Dr House",
      categorie: "Série",
      image: 'assets/imgs/dr_house.webp',
    ),
    Media(
      nom: "Stranger Things",
      categorie: "Série",
      image: 'assets/imgs/stranger_things.webp',
    ),
    Media(
      nom: "Better Call Saul",
      categorie: "Série",
      image: 'assets/imgs/better_call_saul.webp',
    ),
    Media(
      nom: "The Boys",
      categorie: "Série",
      image: 'assets/imgs/the_boys.webp',
    ),
    Media(
      nom: "Seigneur des anneaux 1",
      categorie: "Film",
      image: 'assets/imgs/seigneurdesanneaux1.jpg',
    ),
    Media(
      nom: "Seigneur des anneaux 2",
      categorie: "Film",
      image: 'assets/imgs/seigneurdesanneaux2.jpg',
    ),
    Media(
      nom: "Seigneur des anneaux 3",
      categorie: "Film",
      image: 'assets/imgs/seigneurdesanneaux3.jpg',
    ),
    Media(
      nom: "Inception",
      categorie: "Film",
      image: 'assets/imgs/inception.jpg',
    ),
    Media(
      nom: "Le parrain",
      categorie: "Film",
      image: 'assets/imgs/le_parrain.webp',
    ),
    Media(
      nom: "Forrest Gump",
      categorie: "Film",
      image: 'assets/imgs/forrest_gump.webp',
    ),
    Media(
      nom: "Django Unchained",
      categorie: "Film",
      image: 'assets/imgs/django_unchained.jpg',
    ),
    Media(
      nom: "Reservoir Dogs",
      categorie: "Film",
      image: 'assets/imgs/reservoir_dogs.webp',
    ),
    Media(
      nom: "Pulp Fiction",
      categorie: "Film",
      image: 'assets/imgs/pulp_fiction.jpg',
    ),
    Media(
      nom: "Le Grand Bleu",
      categorie: "Film",
      image: 'assets/imgs/le_grand_bleu.webp',
    ),
    Media(
      nom: "Fight Club",
      categorie: "Film",
      image: 'assets/imgs/fight_club.jpg',
    ),
    Media(
      nom: "La ligne verte",
      categorie: "Film",
      image: 'assets/imgs/la_ligne_verte.jpg',
    ),
    Media(
      nom: "Gladiator",
      categorie: "Film",
      image: 'assets/imgs/gladiator.jpg',
    ),
    Media(
      nom: "1984",
      categorie: "Livre",
      image: 'assets/imgs/1984.webp',
    ),
    Media(
      nom: "Le Petit Prince",
      categorie: "Livre",
      image: 'assets/imgs/le_petit_prince.jpg',
    ),
    Media(
      nom: "Dune",
      categorie: "Livre",
      image: 'assets/imgs/dune.webp',
    ),
    Media(
      nom: "Le Petit Prince",
      categorie: "Livre",
      image: 'assets/imgs/le_petit_prince.jpg',
    ),
    Media(
      nom: "Le Parfum",
      categorie: "Livre",
      image: 'assets/imgs/le_parfum.jpg',
    ),
    Media(
      nom: "Cyrano de Bergerac",
      categorie: "Livre",
      image: 'assets/imgs/cyrano_de_bergerac.webp',
    ),
    Media(
      nom: "Dix Petits Nègres",
      categorie: "Livre",
      image: 'assets/imgs/dix_petits_negres.jpg',
    ),
    Media(
      nom: "Le Meilleur des Mondes",
      categorie: "Livre",
      image: 'assets/imgs/le_meilleur_des_mondes.webp',
    ),
    Media(
      nom: "Des souris et des hommes",
      categorie: "Livre",
      image: 'assets/imgs/des_souris_et_des_hommes.jpg',
    ),
    Media(
      nom: "Bilbo le Hobbit",
      categorie: "Livre",
      image: 'assets/imgs/bilbo_le_hobbit.jpg',
    ),
    Media(
      nom: "Fahrenheit 451",
      categorie: "Livre",
      image: 'assets/imgs/fahrenheit_451.png',
    ),
    Media(
      nom: "Hypérion",
      categorie: "Livre",
      image: 'assets/imgs/hyperion.jpg',
    ),
    Media(
      nom: "Antigone",
      categorie: "Livre",
      image: 'assets/imgs/antigone.webp',
    ),
    Media(
      nom: "Dracula",
      categorie: "Livre",
      image: 'assets/imgs/dracula.jpg',
    ),
    Media(
      nom: "La Constance du prédateur",
      categorie: "Livre",
      image: 'assets/imgs/la_constance_du_predateur.jpeg',
    ),
    Media(
      nom: "Le Signal",
      categorie: "Livre",
      image: 'assets/imgs/le_signal.jpeg',
    ),
    Media(
      nom: "Prédateurs",
      categorie: "Livre",
      image: 'assets/imgs/predateurs.jpg',
    ),
    Media(
      nom: "Léviatemps",
      categorie: "Livre",
      image: 'assets/imgs/leviatemps.jpg',
    ),
  ];

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
                    subtitle: Text('${medias[index].categorie}'),
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
            Image.asset(
              widget.media.image,
              width: 150,
              height: 200,
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
            subtitle: Text('${favoriteMedias[index].categorie}'),
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
