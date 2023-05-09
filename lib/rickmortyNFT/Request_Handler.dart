import 'package:http/http.dart' as http;
import 'package:nft_app/rickmortyNFT/Character.dart';
import 'dart:convert';

class Request_Handler {
  Future<List<Character>> getCharacters() async {
    var response =
        await http.get(Uri.parse('https://rickandmortyapi.com/api/character'));
    print(response);
    if (response.statusCode == 200) {
      var results = json.decode(response.body)['results'];
      List<Character> characterList = characterFromJson(results);
      return characterList;
    } else {
      return [];
    }
  }
}
