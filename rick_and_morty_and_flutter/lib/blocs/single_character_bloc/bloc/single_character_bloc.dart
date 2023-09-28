import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'single_character_event.dart';
part 'single_character_state.dart';

class SingleCharacterBloc extends Bloc<SingleCharacterEvent, SingleCharacterState> {
  SingleCharacterBloc() : super(SingleCharacterInitial()) {
    on<SingleCharacterEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
