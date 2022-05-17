import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayi_tahmin_oyunu/views/sonuc_ekrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({Key? key}) : super(key: key);

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {
  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yardim = "";

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
    debugPrint("Uretilen Rastgele Sayi : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tahmin Ekrani'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Kalan Hak: $kalanHak",
                style: const TextStyle(
                  color: Colors.deepOrange,
                  fontSize: 30,
                ),
              ),
              Text(
                "Yardim : $yardim",
                style: TextStyle(color: Colors.cyan[600], fontSize: 20),
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: tfTahmin,
                  decoration: const InputDecoration(
                    labelText: "Tahmin",
                    prefixIcon: Icon(Icons.numbers),
                    border: OutlineInputBorder(),
                  ),
                  maxLength: 3,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 50,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      kalanHak--;
                    });
                    int tahmin = int.parse(tfTahmin.text);
                    if (tahmin == rastgeleSayi) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SonucEkrani(sonuc: true),
                          ));
                      return;
                    }
                    if (tahmin > rastgeleSayi) {
                      setState(() {
                        yardim = "Tahmini azalt";
                      });
                    } else {
                      setState(() {
                        yardim = "Tahmini Arttir";
                      });
                    }
                    if (kalanHak == 0) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SonucEkrani(sonuc: false),
                          ));
                    }
                    tfTahmin.text = "";
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.ads_click_outlined),
                      SizedBox(width: 5),
                      Text("Tahmin Et"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
