class Character {
  late int charId;
  late String name;
  late String nickname;
  late String image;
  late List<dynamic> jobs;
  late String deadorlive;
  late List<dynamic> appearance;
  late String actorName;
  late String catogry;
  late List<dynamic> betterCallSaulAppearance;

  Character.fromJson(Map<String, dynamic> json) {
    charId = json["char_id"];
    name = json["name"];
    nickname = json["nickname"];
    image = json["img"];
    jobs = json["occupation"];
    deadorlive = json["status"];
    appearance = json["appearance"];
    actorName = json["portrayed"];
    catogry = json["category"];
    betterCallSaulAppearance = json["better_call_saul_appearance"];
  }
}
