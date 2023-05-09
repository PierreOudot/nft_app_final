import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nft_app/rickmortyNFT/Character.dart';
import 'package:nft_app/rickmortyNFT/Request_Handler.dart';

class MarketPlace extends StatefulWidget {
  const MarketPlace({Key? key}) : super(key: key);

  @override
  State<MarketPlace> createState() => _MarketPlaceState();
}

class _MarketPlaceState extends State<MarketPlace> {
  late Future<List<Character>> _characterList;

  @override
  void initState() {
    super.initState();
    Request_Handler rh = new Request_Handler();
    _characterList = rh.getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: _characterList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final characterList = snapshot.data!;
          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: characterList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final character = characterList[index];
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.33,
                      child: Text(character.name),
                    );
                  },
                ),
              ),
            ],
          );
        } else if (snapshot.hasError) {
          throw AlertDialog();
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
