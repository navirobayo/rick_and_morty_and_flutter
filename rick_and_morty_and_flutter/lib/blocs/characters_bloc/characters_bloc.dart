import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rick_and_morty_and_flutter/models/character_data_ui_model.dart';
import 'package:rick_and_morty_and_flutter/repository/characters_repo.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<CharactersEventLoad>(charactersEventLoad);
  }

  FutureOr<void> charactersEventLoad(
      CharactersEventLoad event, Emitter<CharactersState> emit) async {
    emit(CharactersFetchingLoading());

    try {
      List<CharacterDataUiModel> characters =
          await CharactersRepo.getCharacters(page: event.page);

      emit(CharactersFetchingSuccess(characters));
    } catch (e) {
      emit(CharactersFetchingError(e.toString()));
    }
  }
}
