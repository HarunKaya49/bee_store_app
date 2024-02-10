import 'package:bee_store/sayfalar/anasayfa.dart';
import 'package:bee_store/sayfalar/giris_sayfasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YuklenmeSayfasi extends StatelessWidget {
  const YuklenmeSayfasi({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (_, snapshot) {
          final girisYapildi = snapshot.hasData && snapshot.data != null;
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: girisYapildi ? const Anasayfa() : const GirisSayfasi(),
          );
        });
  }
}
