// ignore_for_file: prefer_const_constructors, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:bloc_app/businesse_logic/cubit/characters_cubit.dart';
import 'package:bloc_app/data/models/character.dart';
import 'package:bloc_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_app/constrains/colors.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late List<Character> allcharacters;
  late List<Character> searchForCharacters;
  bool _isSearching = false;
  final searchTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget _bulidSearchField() {
    return TextField(
      controller: searchTextController,
      cursorColor: mycolors.gry,
      decoration: InputDecoration(
        hintText: 'Find A Character ...',
        border: InputBorder.none,
        hintStyle: TextStyle(
          color: mycolors.gry,
          fontSize: 18,
        ),
      ),
      style: TextStyle(
        color: mycolors.gry,
        fontSize: 18,
      ),
      onChanged: (searchedCharacter) {
        addSearchedCharacterToList(searchedCharacter);
      },
    );
  }

  void addSearchedCharacterToList(String searchedCharacter) {
    searchForCharacters = allcharacters
        .where((Character) =>
            Character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _bulidAppbarActions() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearHistory();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: mycolors.gry,
          ),
        ),
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: Icon(
              Icons.search,
              color: mycolors.gry,
            ))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearHistory();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearHistory() {
    searchTextController.clear();
  }

  Widget bulidCharacterList() {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: searchTextController.text.isEmpty
            ? allcharacters.length
            : searchForCharacters.length,
        itemBuilder: (ctx, index) {
          // todo
          return CharacterItem(
              character: searchTextController.text.isEmpty
                  ? allcharacters[index]
                  : searchForCharacters[index]);
        });
  }

  Widget bulidWidgetListWidget() {
    return SingleChildScrollView(
      child: Container(
        color: mycolors.gry,
        child: Column(
          children: [
            bulidCharacterList(),
          ],
        ),
      ),
    );
  }

  Widget buildBlocwidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharacterLoaded) {
          allcharacters = (state).characters;
          return bulidWidgetListWidget();
        } else {
          return showLoadingIndecaator();
        }
      },
    );
  }

  Widget showLoadingIndecaator() {
    return Center(
      child: CircularProgressIndicator(
        color: mycolors.ylo,
      ),
    );
  }

  Widget _bulidAppbar() {
    return Text(
      'BB Characters',
      style: TextStyle(color: mycolors.gry),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: _isSearching
            ? BackButton(
                color: mycolors.gry,
              )
            : Container(),
        backgroundColor: mycolors.ylo,
        title: _isSearching ? _bulidSearchField() : _bulidAppbar(),
        actions: _bulidAppbarActions(),
      ),
      body: buildBlocwidget(),
    );
  }
}
