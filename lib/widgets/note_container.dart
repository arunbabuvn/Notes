import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class NotesContainer extends StatelessWidget {
  const NotesContainer(this.title, {super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.sizeOf(context).height * 0.6),
            padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.09),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(103, 179, 179, 179),
            ),
            child: Wrap(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
              ],
            ),
          ),
          onTap: () => context.goNamed("note"),
        ),
        const Gap(15),
      ],
    );
  }
}
