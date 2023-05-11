import 'package:flutter/material.dart';
import 'package:nft_app/rickmortyNFT/Character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({super.key, required this.character});

  Color setRarityColor(Character character) {
    int rarity = character.rarity;
    switch (rarity) {
      case 0:
        return Color.fromRGBO(126, 255, 143, 1);
      case 1:
        return Color.fromRGBO(245, 3, 201, 1);
      case 2:
        return Color.fromRGBO(65, 141, 255, 1);
      case 3:
        return Color.fromRGBO(255, 123, 0, 1);
      default:
        return Color.fromRGBO(255, 255, 255, 1);
    }
  }

  String getRarityToString(Character character) {
    int rarity = character.rarity;

    switch (rarity) {
      case 0:
        return "Commun";
      case 1:
        return "Rare";
      case 2:
        return "Légendaire";
      case 3:
        return "Exotique";
      default:
        return "Toto";
    }
  }

  Color getStatusColor(Character character) {
    String status = character.status;

    switch (status) {
      case "Dead":
        return Color.fromRGBO(245, 1, 1, 1);
      case "Alive":
        return Color.fromRGBO(11, 245, 3, 1);
      case "unknown":
        return Color.fromRGBO(121, 119, 119, 1);
      default:
        return Color.fromRGBO(121, 119, 119, 1);
    }
  }

  String getStatusSeparator(Character character) {
    if (character.type != null ||
        character.type != "" ||
        character.type != " ") {
      return "-";
    }

    return "";
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.02,
        bottom: MediaQuery.of(context).size.height * 0.02,
        left: MediaQuery.of(context).size.width * 0.02,
        right: MediaQuery.of(context).size.width * 0.02,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            style: BorderStyle.solid,
            strokeAlign: BorderSide.strokeAlignOutside,
            width: 2,
            color: setRarityColor(character),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    color: setRarityColor(character),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        top: 10,
                      ),
                      child: Text(
                        character.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Text(
                        character.species,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                )),
            Image.network(
              character.image,
              height: MediaQuery.of(context).size.height * 0.5,
              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                bottom: 10,
                right: 10,
              ),
              child: Row(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Dernière posirion connue :",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        character.location.name,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 6,
                        ),
                        child: const Text(
                          "Apperçu dans:",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const Text(
                        "Rick & Morty",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                  Expanded(
                    flex: 4,
                    child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  right: 4,
                                ),
                                child: Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: getStatusColor(character),
                                    )),
                              ),
                              Text(
                                character.status,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            character.type,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: setRarityColor(character),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(getRarityToString(character)),
                                    )),
                              ],
                            ),
                          ),
                          //const Spacer(),
                        ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                left: 10,
                bottom: 10,
                right: 10,
              ),
              child: Row(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/images/Vector.png",
                          color: Colors.black,
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 4,
                          ),
                          child: Text(
                            character.price.toStringAsFixed(4),
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => {
                      print("toto"),
                    },
                    child: const Text(
                      "ACHETER",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color.fromRGBO(98, 0, 238, 1.0),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
