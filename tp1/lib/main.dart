import 'package:flutter/material.dart';

void main() => runApp(const BottomNavigationBarExampleApp());

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BottomNavigationBarMenu(),
    );
  }
}

class BottomNavigationBarMenu extends StatefulWidget {
  const BottomNavigationBarMenu({super.key});

  @override
  State<BottomNavigationBarMenu> createState() => _BottomNavigationBarMenuState();
}

class _BottomNavigationBarMenuState extends State<BottomNavigationBarMenu> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetOptions = <Widget>[
      _buildListView(), // This should be inside the build method
      const Text(
        'Index 1: Musiques',
        style: optionStyle,
      ),
      const Text(
        'Index 2: XX',
        style: optionStyle,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Center(
          child: Text(
            'AMSE - Application de Musiques et Series Ensemble',
            style: optionStyle,
          ),
        ),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Series',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.music_note),
            label: 'Musiques',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.north),
            label: 'XX',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }

  static const List<String> description = <String>[
    'A', 
    'B', 
    'C'
    ];
  static const List<String> images = <String>['test.jpg', 'test.jpg', 'test.jpg'];

  Widget _buildListView() {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: description.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18), // Vous pouvez ajuster le rayon selon votre préférence
            color: Colors.black26,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                IconButton(
                onPressed: () {
                  // appState.toggleFavorite();
                },
                icon: const Icon(Icons.favorite),
              ),

                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image(
                    image: AssetImage('assets/images/${images[index]}'),
                    height: 100,
                    alignment: Alignment.centerLeft,
                    ),
                ),

                const SizedBox(width: 8,),

                Flexible(
                  child: Text(
                  'Description\njifgje ${description[index]}',
                  ),
                )
              ]
              ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  
}
