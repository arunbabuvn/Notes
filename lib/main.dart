import 'package:flutter/material.dart';
import 'package:notes/router.dart';
import 'package:notes/routes/home_route.dart';
import 'package:notes/themes/light_theme.dart';
import 'package:notes/themes/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      routerConfig: appRouter,
      // home: const HomeRoute(),
    );
  }
}
