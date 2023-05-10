// To parse this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';
import 'dart:math';

List<Character> characterFromJson(String str) =>
    List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

String characterToJson(List<Character> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Character {
  int id;
  String name;
  String status;
  String species;
  String type;
  String gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  Uri url;
  DateTime created;
  int rarity;
  double price;

  Character(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created,
      required this.rarity,
      required this.price});

  factory Character.fromJson(Map<String, dynamic> json) => Character(
      id: json["id"],
      name: json["name"],
      status: json["status"],
      species: json["species"],
      type: json["type"],
      gender: json["gender"],
      origin: Location.fromJson(json["origin"]),
      location: Location.fromJson(json["location"]),
      image: json["image"],
      episode: List<String>.from(json["episode"].map((x) => x)),
      url: Uri.parse(json["url"]),
      created: DateTime.parse(json["created"]),
      rarity: Random().nextInt(4),
      price: Random().nextDouble() * 0.500);

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": species,
        "type": type,
        "gender": gender,
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
        "rarity": rarity
      };

  void setRarity() {
    List<int> rarityValues = [
      1,
      2,
      3,
    ];
    Random random = Random();
    int index = random.nextInt(4);

    rarity = rarityValues[index];
  }
}

class Location {
  String name;
  Uri url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: Uri.parse(json["url"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}
