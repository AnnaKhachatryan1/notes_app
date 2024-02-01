import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(
          selectedIndex == 0 ? "Add Note" : "All Notes",
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        selectedFontSize: 20 ,
        unselectedItemColor: Colors.black87,
        unselectedFontSize: 14,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          currentIndex: selectedIndex,
          onTap: (value) {
            selectedIndex = value;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(icon: Container(), label: "Add Note"),
            BottomNavigationBarItem(icon: Container(), label: "All Notes"),
          ]),
          
          body: selectedIndex == 0 ?  myAddNote(): myAllNotes(),
    );
  }
  

  Widget myAddNote(){
    return Container(color: Colors.yellow, child: Center( child: Text("Hello"),),) ;
  }

  Widget myAllNotes(){
    return Container(color: Colors.green, child: Center( child: Text("Hy"),),) ;
  }
}
