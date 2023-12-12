import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:logger/logger.dart';
import 'package:notes/services/firestore_service.dart';
import 'package:notes/widgets/dialog_box.dart';
import 'package:notes/widgets/note_container.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute({super.key});

  @override
  State<HomeRoute> createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    final FireStoreService fireStoreService = FireStoreService();
    List notes = [];
    var log = Logger();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return DialogBox(
                  titleController: titleController,
                  descriptionController: descriptionController,
                );
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
              StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection("notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No data available'),
                    );
                  } else {
                    final List<QueryDocumentSnapshot<Map<String, dynamic>>>
                        docs = snapshot.data!.docs.cast<
                            QueryDocumentSnapshot<Map<String, dynamic>>>();
                    return Expanded(
                      child: ListView.builder(
                        itemCount: docs.length,
                        itemBuilder: (context, index) {
                          final title = docs[index]['title'];
                          log.d(title);
                          return NotesContainer(
                            title: title,
                          );
                        },
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
