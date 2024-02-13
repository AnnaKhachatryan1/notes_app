import 'package:collection/collection.dart';
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
  List<String> allNotes = [];
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            centerTitle: true,
            title: Text(
              selectedIndex == 0 ? "Add Note" : "All Notes",
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.black,
              selectedFontSize: 20,
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
          body: selectedIndex == 0 ? myAddNote() : myAllNotes(),
        ));
  }

  Widget myAddNote() {
    return Center(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      decoration: BoxDecoration(border: Border.all()),
                      child: TextFormField(
                        controller: notesController,
                        maxLines: 5,
                        decoration: InputDecoration(border: InputBorder.none),
                        // onChanged: (value) {
                        //   tempNote = value;
                        //   setState(() {});
                        // },
                      )),
                  TextButton(
                      onPressed: () {
                        allNotes.add(notesController.text);
                        FocusManager.instance.primaryFocus?.unfocus();
                        notesController.value = TextEditingValue.empty;
                        print(allNotes);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                        color: Theme.of(context).colorScheme.inversePrimary,
                        child: Text(
                          "Add",
                          style: TextStyle(color: Colors.white),
                        ),
                      ))
                ],
              ),
            )));
  }

  Widget myAllNotes() {
    List<Widget> widgets = allNotes.mapIndexed((index, note) {
      return Container(
          // height: 50,
          color: index % 2 == 0 ? Colors.black : Colors.white,
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 300.0,
                  maxWidth: 300.0,
                  minHeight: 30.0,
                  maxHeight: 100.0,
                ),
                child: Text(note,
                    style: TextStyle(
                        color: index % 2 == 0 ? Colors.white : Colors.black)),
              )));
    }).toList();

    return Container(child: ListView(children: widgets));
  }
}
