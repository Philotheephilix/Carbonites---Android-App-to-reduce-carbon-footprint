// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carbon Pi',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    PageOne(),
    PageTwo(),
    PageThree(),
    PageFour(),
    PageFive(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 187, 92, 10),
      drawer: Drawer(
        backgroundColor: Color.fromRGBO(226, 94, 62, 15),
        child: Column(
          children: [
            DrawerHeader(
                child: Icon(
              Icons.favorite,
              size: 80,
            )),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("A B O U T"),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(226, 94, 62, 15),
        title: Text('Carbon Pi'),
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(226, 94, 62, 15),
        selectedItemColor: Color.fromRGBO(255, 155, 80, 15),
        unselectedItemColor: Color.fromRGBO(198, 61, 47, 15),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Page 3',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Page 4',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page 5',
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 1 Content'),
    );
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 2 Content'),
    );
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 3 Content'),
    );
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 4 Content'),
    );
  }
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Page 5 Content'),
    );
  }
}
