import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:rick_and_morty_and_flutter/models/search_characters_data_ui_model.dart';
import 'package:rick_and_morty_and_flutter/repository/search_characters_repo.dart';

part 'search_characters_event.dart';
part 'search_characters_state.dart';

class SearchCharactersBloc
    extends Bloc<SearchCharactersEvent, SearchCharactersState> {
  SearchCharactersBloc() : super(SearchCharactersInitial()) {
    on<SearchCharactersEventLoad>(searchCharactersEventLoad);
  }

  FutureOr<void> searchCharactersEventLoad(SearchCharactersEventLoad event,
      Emitter<SearchCharactersState> emit) async {
    emit(SearchCharactersFetchingLoading());

    try {
      final query =
          event.query ?? ''; // Provide a default value if query is null
      List<SearchCharactersDataUiModel> searchCharacters =
          await SearchCharactersRepo.getSearchCharacters(query);

      emit(SearchCharactersFetchingSuccess(searchCharacters));
    } catch (e) {
      emit(SearchCharactersFetchingError(e.toString()));
    }
  }
}
