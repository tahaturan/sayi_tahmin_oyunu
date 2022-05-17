import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/views/tahmin_ekrani.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnaSayfa"),
      ),
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.gamepad_outlined),
                Text(
                  "Tahmin Oyunu",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Image.asset("assets/images/anasayfa.jpg"),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TahminEkrani(),
                      ));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Oyuna Basla"),
                    SizedBox(width: 5),
                    Icon(Icons.start_sharp),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
