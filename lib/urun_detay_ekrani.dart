import 'package:flutter/material.dart';

class UrunDetayEkrani extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İkinci Sayfa'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Ana sayfaya geri dönme işlemi
            Navigator.pop(context);
          },
          child: const Text('Geri Dön'),
        ),
      ),
    );
  }
}
