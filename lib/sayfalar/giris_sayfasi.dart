import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  var _yukleniyor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text("Giriş Sayfası")),
          if (_yukleniyor)
            const CircularProgressIndicator()
          else
            TextButton(
                onPressed: () {
                  _yukleniyor = true;
                  setState(() {});
                  FirebaseAuth.instance.signInAnonymously();
                },
                child: Text("Giriş yap"))
        ],
      ),
    );
  }
}
