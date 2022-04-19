import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/models/character.dart';
import 'package:bloc_app/data/repostery/characters_repository.dart';
import 'package:meta/meta.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  late List<Character> charas = [];

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharacterLoaded(characters));
      // ignore: unnecessary_this
      this.charas = characters;
    });
    return charas;
  }
}
