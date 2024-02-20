import 'package:flutter/material.dart';

class AdminPaneli extends StatefulWidget {
  const AdminPaneli({super.key});

  @override
  State<AdminPaneli> createState() => _AdminPaneliState();
}

class _AdminPaneliState extends State<AdminPaneli> {
  var baslik = "";
  var resimAdresi = "";
  var usdFiyat = 0;
  var indirimOrani = 0;
  var puan = 0;
  var degerlendirmeSayisi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Admin Paneli")),
      body: Column(
        children: [
          TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return SizedBox(
                        height: 200,
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextField(
                                  decoration: const InputDecoration(
                                      hintText: "Başlık gir"),
                                  onChanged: (deger) {
                                    baslik = deger;
                                  },
                                ),
                                TextField(
                                  decoration: const InputDecoration(
                                      hintText: "Fiyat gir"),
                                  keyboardType: TextInputType.number,
                                  onChanged: (deger) {
                                    usdFiyat = int.parse(deger);
                                  },
                                ),
                                TextField(
                                  decoration: const InputDecoration(
                                      hintText:
                                          "indirim oranı gir (0.xx şeklinde)"),
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (deger) {
                                    if (int.parse(deger) <= 1) {
                                      baslik = deger;
                                    }
                                  },
                                ),
                                const SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Ekle'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: const Text("Ürün Ekle"))
        ],
      ),
    );
  }
}
