import 'package:flutter/material.dart';

class page2 extends StatelessWidget {
  page2({
    super.key,
  });

  List nfts = [
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset("assets/images/NFT/NFT_0.jpg"),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset("assets/images/NFT/NFT_1.jpg"),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset("assets/images/NFT/NFT_2.jpg"),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset("assets/images/NFT/NFT_3.jpg"),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Image.asset("assets/images/NFT/NFT_4.jpg"),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(4.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset("assets/images/NFT/NFT_5.jpg"),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.max, children: [
      Container(
          width: MediaQuery.of(context).size.width * 0.30,
          height: MediaQuery.of(context).size.height * 0.30,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover),
            shape: BoxShape.circle, 
          ),
          child: Image.asset(
            "assets/images/Vector.png",
            scale: 0.8,
          )),
      Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 2),
          child: Column(children: [
            Text("Imaginez posséder ces JPEG",
                maxLines: 2,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28,
                    fontWeight: FontWeight.w900)),
            const SizedBox(height: 25),
            SizedBox(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: nfts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return nfts[index];
                  }),
            ),
            const SizedBox(height: 40),
            Text(
                "Vous possédez un identifiant unique sur la blockchain qui pourra renvoyer (ou non) vers un JPEG hébergé sur un serveur qui sera certainement fermé dans quelques années.",
                maxLines: 4,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400)),
            const SizedBox(height: 150),
            Row(children: [
              TextButton(
                  onPressed: () => print("Hello"),
                  child: const Text("PASSER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF65635E)))),
              const Spacer(),
              MaterialButton(
                onPressed: () => print("hello"),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                textColor: Colors.white,
                color: Colors.tealAccent[200],
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Icon(Icons.arrow_forward),
                ),
              )
            ]),
            const SizedBox(
              height: 44,
            )
          ]))
    ]);
  }
}
