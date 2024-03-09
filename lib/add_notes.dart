import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({required this.builder,super.key});

  final void Function(String text) builder;

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController notesController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return myAddNote();
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
                        widget.builder(notesController.text);
                        // allNotes.add(notesController.text);
                        FocusManager.instance.primaryFocus?.unfocus();
                        notesController.value = TextEditingValue.empty;
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
}
