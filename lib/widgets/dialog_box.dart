import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
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
                  scrollPadding: const EdgeInsets.only(bottom: 30),
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
                const Text("Discription"),
                Gap(MediaQuery.sizeOf(context).height * 0.016),
                TextField(
                  scrollPadding: const EdgeInsets.only(bottom: 30),
                  minLines: 1,
                  maxLines: 3,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide.none,
                    ),
                    fillColor: const Color.fromARGB(103, 179, 179, 179),
                    filled: true,
                    hintText: "Discription",
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
                      onPressed: () {},
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
