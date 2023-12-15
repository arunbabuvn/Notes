import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NoteRoute extends StatelessWidget {
  var title;
  var description;
  NoteRoute({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.sizeOf(context).height * 0.9,
          ),
          margin: const EdgeInsets.all(20),
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: const Color.fromARGB(103, 179, 179, 179),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Container(
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.edit),
                          ),
                          const Gap(10),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Title"),
                    const Gap(30),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.66,
                      child: ListView(
                        children: const [
                          Text(
                              """dsfasdfasdfasdfasdfasdfasdfasdfA precise and comprehensive “Scope of Work” (SOW) has become 
                              essential in the rapidly evolving app development. It offers a development process roadmap and 
                              ensures that the client and the developer defines clear expectations, minimizing the potential for 
                              miscommunication and conflict. By laying out the framework, the SOW document guarantees that 
                              the client and the developer have the same objectives, deliverables, and timelines.This article 
                              explores the technical aspects of creating a successful SOW for mobile app development, emphasising its 
                              importance and offering an invaluable resource to ensure the success of your projects."""),
                        ],
                      ),
                    ),
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
