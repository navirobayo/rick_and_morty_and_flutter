import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:rick_and_morty_and_flutter/features/characters/models/character_data_ui_model.dart';
import 'package:rick_and_morty_and_flutter/repos/characters_repo.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  CharactersBloc() : super(CharactersInitial()) {
    on<CharactersEventLoad>(charactersEventLoad);
  }

  FutureOr<void> charactersEventLoad(
      CharactersEventLoad event, Emitter<CharactersState> emit) async {
    emit(CharactersFetchingLoading());
    List<CharacterDataUiModel> characters =
        await CharactersRepo.getCharacters();

    emit(CharactersFetchingSuccess(characters));
  }
}
