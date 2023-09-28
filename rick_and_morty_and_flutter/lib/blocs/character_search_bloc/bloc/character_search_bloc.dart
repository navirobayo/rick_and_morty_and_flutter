import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'character_search_event.dart';
part 'character_search_state.dart';

class CharacterSearchBloc extends Bloc<CharacterSearchEvent, CharacterSearchState> {
  CharacterSearchBloc() : super(CharacterSearchInitial()) {
    on<CharacterSearchEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
