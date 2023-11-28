import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoteRoute extends StatelessWidget {
  const NoteRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(40),
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Title"),
              Gap(30),
              Text("dsfasdfasdfasdfasdfasdfasdfasdf")
            ],
          ),
        ),
      ),
    );
  }
}
