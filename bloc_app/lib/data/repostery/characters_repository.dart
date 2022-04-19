import 'package:bloc_app/data/models/character.dart';
import 'package:bloc_app/data/web_serveces/characters_api.dart';

class CharactersRepository {
  final CharacterWebServices characterWebServices;

  CharactersRepository(this.characterWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters =
        await characterWebServices.getAllCharacters().then((value) {
      print("sucsess Ahmed");
    }).catchError((Er) {
      print("no internet ");
    });
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
