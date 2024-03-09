import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

class AllNotes extends StatefulWidget {
  const AllNotes({super.key, required this.notes, required this.notifier});
  final List<String> notes;
  final ValueNotifier<int> notifier;

  @override
  State<AllNotes> createState() => _AllNotesState();
}

class _AllNotesState extends State<AllNotes> {
  @override
  Widget build(BuildContext context) {
    return myAllNotes();
  }

  Widget myAllNotes() {
    final widgets = widget.notes.mapIndexed((index, note) {
      return Container(
          color: index % 2 == 0 ? Colors.black : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(note,
                style: TextStyle(
                    color: index % 2 == 0 ? Colors.white : Colors.black)),
          ));
    }).toList();

    return ListView(children: widgets);
  }
}
