import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Wallet extends StatefulWidget {
  const Wallet({super.key, required this.title});

  final String title;

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  double _btcBag = 0;
  double _euroBag = 0;
  double _textFieldValue = 0.0;

  void _sellBtc() {
    if (_textFieldValue <= _btcBag && _textFieldValue > 0) {
      double eurAmount = _textFieldValue * 26423.1;
      setState(() {
        _btcBag = _btcBag - _textFieldValue;
        _euroBag = _euroBag + eurAmount;
        _textFieldValue = 0.0;
      });
    }
  }

  void _buyBtc() {
    if (_textFieldValue <= _euroBag && _textFieldValue > 0) {
      double btcAmount = _textFieldValue * 0.000038;
      setState(() {
        _euroBag = _euroBag - _textFieldValue;
        _btcBag = _btcBag + btcAmount;
        _textFieldValue = 0.0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.

        title: Text(""),
        backgroundColor: Theme.of(context).primaryColor,
      ),

      body: Column(mainAxisSize: MainAxisSize.max, children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomCenter,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20,
                    ),
                    child: MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(35),
                        ),
                      ),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                        child: Text("Earn 0.0001 BTC"),
                      ),
                      textColor: Colors.white,
                      color: Color.fromRGBO(3, 218, 197, 1.0),
                      focusColor: Color.fromRGBO(112, 239, 222, 1.0),
                      onPressed: _earnBtc,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        double.parse(_btcBag.toStringAsFixed(4)).toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/Vector.png")),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "My BTC Wallet",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 10,
            bottom: 5,
            left: 20,
            right: 20,
          ),
          child: TextFormField(
            validator: (value) {
              if (value != null && value.contains(RegExp("[^.]*[a-zA-Z]*"))) {
                return "Only numbers and .";
              }
            },
            onChanged: (value) {
              String cleaned_value = value.replaceAll(' ', '');
              double? parsed_value = double.tryParse(cleaned_value);
              if (parsed_value != null) {
                _textFieldValue = parsed_value;
              }
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color.fromRGBO(3, 218, 197, 1.0),
                  style: BorderStyle.solid,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(187, 134, 252, 1.0),
                      style: BorderStyle.solid)),
              labelStyle: TextStyle(color: Color.fromRGBO(3, 218, 197, 1.0)),
              labelText: "Amount",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
            top: 5,
            bottom: 10,
            left: 20,
            right: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text("Buy  BTC"),
                ),
                textColor: Colors.white,
                color: Color.fromRGBO(3, 218, 197, 1.0),
                focusColor: Color.fromRGBO(112, 239, 222, 1.0),
                onPressed: _buyBtc,
              ),
              SizedBox(
                width: 5,
              ),
              MaterialButton(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text("Sell BTC"),
                ),
                textColor: Colors.white,
                color: Color.fromRGBO(3, 218, 197, 1.0),
                focusColor: Color.fromRGBO(112, 239, 222, 1.0),
                onPressed: _sellBtc,
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/background_light.png"),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        double.parse(_euroBag.toStringAsFixed(4)).toString(),
                        style: TextStyle(
                          color: Color.fromRGBO(187, 134, 252, 1.0),
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          "€",
                          style: TextStyle(
                            color: Color.fromRGBO(187, 134, 252, 1.0),
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      "My Euro Wallet",
                      style: TextStyle(
                        color: Color.fromRGBO(187, 134, 252, 1.0),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
