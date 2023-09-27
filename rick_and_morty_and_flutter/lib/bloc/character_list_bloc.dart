import 'dart:async';
import 'package:rick_and_morty_and_flutter/bloc/bloc.dart';
/* 
class CharacterListBloc implements Bloc {
  final _searchQueryController = StreamController<String?>();
  Sink<String?> get searchQuery => _searchQueryController.sink;
  // 4
  late Stream<List<Article>?> articlesStream;

  ArticleListBloc() {
    // 5
    articlesStream = _searchQueryController.stream
        .asyncMap((query) => _client.fetchArticles(query));
  }

  // 6
  @override
  void dispose() {
    _searchQueryController.close();
  }
} */
