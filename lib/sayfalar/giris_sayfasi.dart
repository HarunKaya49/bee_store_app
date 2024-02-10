import 'package:bee_store/sayfalar/kayit_sayfasi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GirisSayfasi extends StatefulWidget {
  const GirisSayfasi({super.key});

  @override
  State<GirisSayfasi> createState() => _GirisSayfasiState();
}

class _GirisSayfasiState extends State<GirisSayfasi> {
  var _yukleniyor = false;
  var _hataMesaji = "";
  var _email = "";
  var _sifre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Giriş Sayfası"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_hataMesaji.isNotEmpty)
              Text(
                "Bir hata oluştu: $_hataMesaji",
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            TextField(
              decoration: const InputDecoration(hintText: "Email adresini gir"),
              keyboardType: TextInputType.emailAddress,
              onChanged: (deger) {
                _email = deger;
                if (_hataMesaji.isNotEmpty) {
                  _hataMesaji = "";
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 24),
            TextField(
              decoration: const InputDecoration(hintText: "Şifreni gir"),
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (deger) {
                _sifre = deger;
                if (_hataMesaji.isNotEmpty) {
                  _hataMesaji = "";
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 32),
            if (_yukleniyor)
              const CircularProgressIndicator()
            else
              TextButton(
                  onPressed: () {
                    final regexExp = RegExp(
                        // ignore: valid_regexps
                        r"^^[a-Za-z0-9._+\-\']+@[A-Za-z0-9.\-]+\.[A-Za-z]{2,}$");
                    final isValid =
                        regexExp.hasMatch(_email) && _sifre.length > 5;
                    if (isValid) {
                      _yukleniyor = true;
                      setState(() {});
                      FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                        email: _email,
                        password: _sifre,
                      )
                          // ignore: body_might_complete_normally_catch_error
                          .catchError((hataMesaji) {
                        _hataMesaji = hataMesaji.toString();
                        _yukleniyor = false;
                        setState(() {});
                      });
                    } else {
                      _hataMesaji = "Email adresi veya şifre geçersiz!";
                      setState(() {});
                    }
                  },
                  child: const Text("Giriş yap")),
            const Divider(height: 64),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return const KayitSayfasi();
                  }));
                },
                child: const Text("Kayıt Ol"))
          ],
        ),
      ),
    );
  }
}
