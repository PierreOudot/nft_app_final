import 'package:http/http.dart' as http;
import 'package:nft_app/rickmortyNFT/Character.dart';
import 'dart:convert';

class Request_Handler {
  String leftBracket = "{";
  String rightBracket = "}";

  Future<List<Character>> getCharacters() async {
    var response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    print(response);
    if (response.statusCode == 200) {
      List<Character> characterList = List<Character>.from(json
          .decode(response.body)['results']
          .map((x) => Character.fromJson(x)));
      return characterList;
    } else {
      return [];
    }
  }
}
