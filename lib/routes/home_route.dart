import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/widgets/dialog_box.dart';
import 'package:notes/widgets/note_container.dart';

class HomeRoute extends StatelessWidget {
  const HomeRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return const DialogBox();
              });
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notes",
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  Hero(
                    tag: "searchTag",
                    child: Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 0.13,
                          height: MediaQuery.sizeOf(context).width * 0.13,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(103, 179, 179, 179),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(Icons.search),
                        ),
                        onTap: () => context.goNamed("search"),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              Expanded(
                child: ListView(
                  children: const [
                    NotesContainer("Test tile"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
