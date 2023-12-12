import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/main.dart';
import 'package:notes/services/firestore_service.dart';

class DialogBox extends StatefulWidget {
  var titleController;
  var descriptionController;

  DialogBox({
    super.key,
    required this.titleController,
    required this.descriptionController,
  });

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  @override
  Widget build(BuildContext context) {
    final FireStoreService fireStoreService = FireStoreService();

    onSave() {
      setState(() {
        fireStoreService.addNote(
          widget.titleController.text,
          widget.descriptionController.text,
        );
      });

      widget.titleController.clear();
      widget.descriptionController.clear();
      context.pop();
    }

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AlertDialog(
        title: const Text('New Note'),
        actions: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Title"),
                const Gap(10),
                TextField(
                  controller: widget.titleController,
                  minLines: 1,
                  maxLines: 2,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    // counterText: "",
                    fillColor: const Color.fromARGB(103, 179, 179, 179),
                    filled: true,
                    hintText: "Title",
                  ),
                ),
                Gap(MediaQuery.sizeOf(context).height * 0.029),
                const Text("Description"),
                Gap(MediaQuery.sizeOf(context).height * 0.016),
                TextField(
                  controller: widget.descriptionController,
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: const Color.fromARGB(103, 179, 179, 179),
                    filled: true,
                    hintText: "Description",
                  ),
                ),
                Gap(MediaQuery.sizeOf(context).height * 0.029),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Cancel"),
                    ),
                    Gap(MediaQuery.sizeOf(context).height * 0.029),
                    ElevatedButton(
                      onPressed: () {
                        widget.titleController.text.isNotEmpty &&
                                widget.descriptionController.text.isNotEmpty
                            ? onSave()
                            : null;
                      },
                      child: const Text("Save"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
