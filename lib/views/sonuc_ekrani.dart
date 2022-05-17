import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  bool sonuc;
  SonucEkrani({Key? key, required this.sonuc}) : super(key: key);

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sonuc Ekrani"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                widget.sonuc
                    ? const Icon(Icons.sentiment_satisfied_outlined, size: 70)
                    : const Icon(Icons.sentiment_dissatisfied_outlined,
                        size: 70),
                Text(
                  widget.sonuc ? "Kazandiniz" : "Kaybettiniz",
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 350,
              child: widget.sonuc
                  ? Image.asset("assets/images/winner.png")
                  : Image.asset("assets/images/lose.jpg"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text("Tekrar Oyna"),
                  SizedBox(width: 5),
                  Icon(Icons.start_sharp),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
