import 'package:flutter/material.dart';

import '../rickmortyNFT/Character.dart';

class WalletModel extends ChangeNotifier {
  List<Character> _nfts = [];
  double _eurBag = 0;
  double _btcBag = 0;

  void addCharacter(Character character) {
    _nfts.add(character);

    notifyListeners();
  }

  void earnBtc() {
    _btcBag = _btcBag + 0.0001;

    notifyListeners();
  }

  
}
