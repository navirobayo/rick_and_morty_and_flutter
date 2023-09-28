/* import 'package:rick_and_morty_and_flutter/data/models/character_schema.dart';

class CharactersResponse {
  final int count;
  final int pages;
  final String? next;
  final String? prev;
  final List<Character> results;

  CharactersResponse({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
    required this.results,
  });

  factory CharactersResponse.fromJson(Map<String, dynamic> json) {
    return CharactersResponse(
      count: json['info']['count'],
      pages: json['info']['pages'],
      next: json['info']['next'],
      prev: json['info']['prev'],
      results: (json['results'] as List)
          .map((characterJson) => Character.fromJson(characterJson))
          .toList(),
    );
  }
} */ 
// Not used yet. Delete if not needed.
