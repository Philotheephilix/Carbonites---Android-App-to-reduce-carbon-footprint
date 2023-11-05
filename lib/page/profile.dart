import 'package:flutter/material.dart';

void main() {
  runApp(const profile());
}

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.teal[300],
            unselectedItemColor: Colors.blueGrey,
            selectedItemColor: Colors.blueAccent,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.money), label: "EXPENSE"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pie_chart), label: "PI TRACK"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "PROFILE"),
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.teal[100],
            child: Column(children: [
              DrawerHeader(child: Icon(Icons.compass_calibration)),
              ListTile(
                leading: Icon(Icons.abc_outlined),
                title: Text("A B O U T"),
              )
            ]),
          ),
          appBar: AppBar(
            title: Text("Carbon Pi"),
            backgroundColor: Colors.teal[300],
          ),
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        ));
  }
}
