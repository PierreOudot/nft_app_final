import 'package:flutter/material.dart';

class page3 extends StatelessWidget {
  page3({
    super.key,
  });

  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Container(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 70,
            ),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                child: Text("Inscrivez vous\nmaintenant",
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w900)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                    "On vous offre un NFT à l'inscription! Il vaudra\nprobablement sont prix un jour,\n quenelle bisous",
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              )
            ]),
          )),
      SizedBox(height: 30),
      Column(
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "id pliss";
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
                labelText: "Identifiant"),
          ),
          SizedBox(
            height: 20,
          ),
          TextFormField(
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "donne mdp";
                }
              },
              decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(3, 218, 197, 1.0),
                        style: BorderStyle.solid),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                        color: Color.fromRGBO(187, 134, 252, 1.0),
                        style: BorderStyle.solid),
                  ),
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(3, 218, 197, 1.0)),
                  labelText: "Password",
                  suffixIcon: IconButton(
                      icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility),
                      onPressed: () {
                        _passwordVisible = !_passwordVisible;
                      })))
        ],
      ),
      SizedBox(height: 30),
      MaterialButton(
        onPressed: () => print("hello"),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(35))),
        textColor: Colors.white,
        color: Colors.tealAccent[200],
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          child: Text("INSCRIPTION"),
        ),
      )
    ]);
  }
}
