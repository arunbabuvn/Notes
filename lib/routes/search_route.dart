import 'package:flutter/material.dart';

class SearchRoute extends StatelessWidget {
  const SearchRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              children: [
                Hero(
                  tag: "searchTag",
                  child: Material(
                    child: TextField(
                      scrollPadding: const EdgeInsets.only(bottom: 30),
                      maxLines: 1,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: const Color.fromRGBO(179, 179, 179, 0.1),
                        filled: true,
                        hintText: "",
                        prefixIcon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
