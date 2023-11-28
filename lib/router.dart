import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/routes/home_route.dart';
import 'package:notes/routes/note_route.dart';
import 'package:notes/routes/search_route.dart';

final appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: "home",
      builder: (context, state) {
        return const HomeRoute();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'search',
          name: "search",
          builder: (context, state) {
            return const SearchRoute();
          },
        ),
        GoRoute(
            path: "note",
            name: "note",
            builder: (context, state) {
              return const NoteRoute();
            }),
      ],
    ),
  ],
);
