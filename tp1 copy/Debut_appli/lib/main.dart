import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class Media {
  final String nom;
  final String categorie;
  final String image;
  Media({required this.nom, required this.categorie, required this.image});
}

class MyApp extends StatelessWidget {
  final List<Media> medias = [
    Media(
        nom: "Harry Potter",
        categorie: 'Film',
        image: 'assets/imgs/harrypotter.webp'),
    Media(
        nom: 'Le sang et l acier',
        categorie: 'Livre',
        image: 'assets/imgs/lesangetlacier.jpg')
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Liste de Films',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Liste de Films'),
        ),
        body: ListView.builder(
          itemCount: medias.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(medias[index].nom),
              subtitle: Text('${medias[index].categorie}'),
              leading: Image.asset(
                '${medias[index].image}',
                width: 50,
                height: 150,
              ),
              // Vous pouvez ajouter d'autres fonctionnalités comme des images, des boutons, etc., ici
            );
          },
        ),
      ),
    );
  }
}

/*class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}*/

class MovieDetailPage extends StatelessWidget {
  final Media media;

  MovieDetailPage({required this.media});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(media.nom),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              media.image,
              width: 50,
              height: 150,
            ),
            Text('Genre: ${media.categorie}'),
            // Ajoutez ici d'autres détails du film que vous souhaitez afficher
          ],
        ),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];
  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}

/*class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        body: Row(
          children: [
            SafeArea(
              child: NavigationRail(
                extended: constraints.maxWidth >= 600,
                destinations: [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                ],
                selectedIndex: selectedIndex,
                onDestinationSelected: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
              ),
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page, // ← Here.
              ),
            ),
          ],
        ),
      );
    });
  }
}

class GeneratorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  appState.toggleFavorite();
                },
                icon: Icon(icon),
                label: Text('Like'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  appState.getNext();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  var appState = context.watch<MyAppState>();
  var pair = appState.current;

  IconData icon;
  if (appState.favorites.contains(pair)) {
    icon = Icons.favorite;
  } else {
    icon = Icons.favorite_border;
  }
  return Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('A random idea:'),
          BigCard(pair: pair),
          SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  print('button pressed');
                  appState.getNext();
                },
                child: Text('Next'),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    appState.toggleFavorite();
                    print(appState.favorites);
                  },
                  icon: Icon(icon),
                  label: Text('Like')),
              SizedBox(width: 10)
            ],
          ),
        ],
      ),
    ),
  );
}

class FavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text('You have '
              '${appState.favorites.length} favorites:'),
        ),
        for (var pair in appState.favorites)
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text(pair.asLowerCase),
          ),
      ],
    );
  }
}

class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
    required this.pair,
  });

  final WordPair pair;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!
        .copyWith(color: theme.colorScheme.primary);
    return Card(
      color: theme.colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(pair.asLowerCase,
            style: style, semanticsLabel: "${pair.first} ${pair.second}"),
      ),
    );
  }
}
*/