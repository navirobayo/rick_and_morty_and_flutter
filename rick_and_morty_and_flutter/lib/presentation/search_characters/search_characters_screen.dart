import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty_and_flutter/blocs/search_characters_bloc/bloc/search_characters_bloc.dart';

class SearchCharactersScreen extends StatefulWidget {
  const SearchCharactersScreen({Key? key}) : super(key: key);

  @override
  _SearchCharactersScreenState createState() => _SearchCharactersScreenState();
}

class _SearchCharactersScreenState extends State<SearchCharactersScreen> {
  final SearchCharactersBloc searchCharactersBloc = SearchCharactersBloc();

  @override
  void initState() {
    searchCharactersBloc.add(SearchCharactersEventLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Characters')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Search ...'),
              onChanged: (query) {
                searchCharactersBloc
                    .add(SearchCharactersEventLoad(query: query));
              },
            ),
          ),
          Expanded(
            child: BlocConsumer<SearchCharactersBloc, SearchCharactersState>(
              bloc: searchCharactersBloc,
              listenWhen: (previous, current) =>
                  current is SearchCharactersState,
              buildWhen: (previous, current) =>
                  current is! SearchCharactersActionState,
              listener: (context, state) {},
              builder: (context, state) {
                switch (state.runtimeType) {
                  case SearchCharactersFetchingLoading:
                    return const Center(child: CircularProgressIndicator());
                  case SearchCharactersFetchingError:
                    final errorState = state as SearchCharactersFetchingError;
                    return Center(child: Text(errorState.errorMessage));
                  case SearchCharactersFetchingSuccess:
                    final successState =
                        state as SearchCharactersFetchingSuccess;
                    return ListView.builder(
                      itemCount: successState.searchCharacters.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title:
                              Text(successState.searchCharacters[index].name),
                          subtitle:
                              Text(successState.searchCharacters[index].status),
                        );
                      },
                    );
                  default:
                    return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
