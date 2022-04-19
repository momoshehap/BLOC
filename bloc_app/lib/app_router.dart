// ignore_for_file: prefer_const_constructors, duplicate_ignore, non_constant_identifier_names, unused_local_variable

import 'package:bloc_app/data/models/character.dart';
import 'package:bloc_app/data/repostery/characters_repository.dart';
import 'package:bloc_app/presentation/screens/character_details.dart';
import 'package:bloc_app/presentation/screens/characters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'businesse_logic/cubit/characters_cubit.dart';
import 'constrains/strings.dart';
import 'data/models/character.dart';
import 'data/web_serveces/characters_api.dart';

class AppRouter {
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharacterWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case characterScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => charactersCubit,
                  // ignore: prefer_const_constructors
                  child: CharacterScreen(),
                ));

      case CharacterDetailesScreen:
        final SelectedCharacter = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => CharacterDetails(
                  character: SelectedCharacter,
                ));
    }
  }
}
