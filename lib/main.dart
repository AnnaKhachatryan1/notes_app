import 'package:flutter/material.dart';
import 'package:notes_app/add_notes.dart';
import 'package:notes_app/all_notes.dart';
import 'package:notes_app/profile.dart';

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
  List<String> allNotes = [];

  ValueNotifier<int> indexNotifier = ValueNotifier(0);
  ValueNotifier<int> counterNotifier = ValueNotifier(0);

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
                title: ValueListenableBuilder(
                    valueListenable: indexNotifier,
                    builder: (context, index, child) {
                      return Text(index == 0
                          ? "Add Note"
                          : index == 1
                              ? "All Notes"
                              : "Profile");
                    })),
            bottomNavigationBar: ValueListenableBuilder(
                valueListenable: indexNotifier,
                builder: (context, index, child) {
                  return BottomNavigationBar(
                      selectedItemColor: Colors.black,
                      selectedFontSize: 20,
                      unselectedItemColor: Colors.black87,
                      unselectedFontSize: 14,
                      backgroundColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      currentIndex: index,
                      onTap: (test) {
                        indexNotifier.value = test;
                        // setState(() {});
                      },
                      items: [
                        BottomNavigationBarItem(
                            icon: Container(), label: "Add Note"),
                        BottomNavigationBarItem(
                            icon: Container(), label: "All Notes"),
                        BottomNavigationBarItem(
                            icon: Container(), label: "Profile"),
                      ]);
                }),
            body: ValueListenableBuilder(
                valueListenable: indexNotifier,
                builder: (context, index, child) {
                  return index == 0
                      ? AddNotes(
                          builder: (text) {
                            allNotes.add(text);
                            
                            counterNotifier.value = allNotes.length;
                            print(text);
                          },
                        )
                      : index == 1
                          ? AllNotes(
                              notes: allNotes,
                              notifier: indexNotifier,
                            )
                          :  Profile(
                            myNotifier: counterNotifier,
                          );
                })));
  }
}
