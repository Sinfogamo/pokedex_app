class Pokemon {
  Pokemon({
    this.abilities,
    this.height,
    this.id,
    this.stats,
    this.types,
  });

  List<Ability> abilities;
  int height;
  int id;
  List<Stat> stats;
  List<Type> types;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: List<Ability>.from(
            json["abilities"].map((x) => Ability.fromJson(x))),
        height: json["height"],
        id: json["id"],
        stats: List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "abilities": List<dynamic>.from(abilities.map((x) => x.toJson())),
        "height": height,
        "id": id,
        "stats": List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": List<dynamic>.from(types.map((x) => x.toJson())),
      };
}

class Ability {
  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Species ability;
  bool isHidden;
  int slot;

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability: Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"],
        slot: json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability.toJson(),
        "is_hidden": isHidden,
        "slot": slot,
      };
}

class Species {
  Species({
    this.name,
    this.url,
  });

  String name;
  String url;

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

class Stat {
  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  int baseStat;
  int effort;
  Species stat;

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        stat: Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat,
        "effort": effort,
        "stat": stat.toJson(),
      };
}

class Type {
  Type({
    this.slot,
    this.type,
  });

  int slot;
  Species type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"],
        type: Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type.toJson(),
      };
}

class Characteristic {
  List<Description> descriptions;

  Characteristic({
    this.descriptions,
  });

  factory Characteristic.fromJson(Map<String, dynamic> json) => Characteristic(
        descriptions: List<Description>.from(
            json["descriptions"].map((x) => Description.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "descriptions": List<dynamic>.from(descriptions.map((x) => x.toJson())),
      };
}

class Description {
  String description;

  Description({
    this.description,
  });
  factory Description.fromJson(Map<String, dynamic> json) => Description(
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
      };
}
