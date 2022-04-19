// ignore_for_file: prefer_const_constructors

import 'package:bloc_app/constrains/colors.dart';
import 'package:bloc_app/data/models/character.dart';
import 'package:flutter/material.dart';

class CharacterDetails extends StatelessWidget {
  final Character character;

  const CharacterDetails({Key? key, required this.character}) : super(key: key);

  Widget bulidSilverAppbar() {
    return SliverAppBar(
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      backgroundColor: mycolors.gry,
      flexibleSpace: FlexibleSpaceBar(
        // centerTitle: true,
        title: Text(
          character.nickname,
          style: TextStyle(color: mycolors.wit),
          textAlign: TextAlign.start,
        ),
        background: Hero(
          tag: character.charId,
          child: Image.network(
            character.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget characterrInfo(String Title, String value) {
    return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(children: [
        TextSpan(
          text: Title,
          style: TextStyle(
            color: mycolors.wit,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        TextSpan(
          text: value,
          style: TextStyle(
            color: mycolors.wit,
            fontWeight: FontWeight.normal,
            fontSize: 16,
          ),
        )
      ]),
    );
  }

  Widget bulidDivider(double EndIndent) {
    return Divider(
      color: mycolors.ylo,
      height: 30,
      endIndent: EndIndent,
      thickness: 2,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mycolors.gry,
      body: CustomScrollView(
        slivers: [
          bulidSilverAppbar(),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(
                margin: EdgeInsets.fromLTRB(14, 14, 14, 0),
                padding: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    characterrInfo('job :', character.jobs.join('/')),
                    bulidDivider(285),
                    characterrInfo('Appeared In :', character.catogry),
                    bulidDivider(220),
                    characterrInfo('Seasons :', character.appearance.join('/')),
                    bulidDivider(250),
                    characterrInfo('status :', character.deadorlive),
                    bulidDivider(260),
                    character.betterCallSaulAppearance.isEmpty
                        ? Container()
                        : characterrInfo('better call saul Seasons :',
                            character.betterCallSaulAppearance.join('/')),
                    character.betterCallSaulAppearance.isEmpty
                        ? Container()
                        : bulidDivider(130),
                    characterrInfo('Actor/Actress :', character.actorName),
                    bulidDivider(200),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 400,
              )
            ]),
          ),
        ],
      ),
    );
  }
}
