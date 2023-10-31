import 'package:flutter/material.dart';
import 'package:rick_and_morty_and_flutter/blocs/characters_bloc/characters_bloc.dart';
import 'package:rick_and_morty_and_flutter/blocs/search_characters_bloc/bloc/search_characters_bloc.dart';
import 'package:rick_and_morty_and_flutter/presentation/search_characters/search_characters_screen.dart';

class One extends StatefulWidget {
  const One({super.key});

  @override
  State<One> createState() => _OneState();
}

class _OneState extends State<One> {
  final SearchCharactersBloc searchCharactersBloc = SearchCharactersBloc();
  final CharactersBloc charactersBloc = CharactersBloc();
  int currentPage = 1;

  @override
  void initState() {
    searchCharactersBloc.add(SearchCharactersEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    width: size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search, color: Colors.black),
                        Expanded(
                          child: GestureDetector(
                            child: Container(
                              child: Text("Search Characters"),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SearchCharactersScreen()),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
