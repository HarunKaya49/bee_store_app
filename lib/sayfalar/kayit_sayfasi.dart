import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class KayitSayfasi extends StatefulWidget {
  const KayitSayfasi({super.key});

  @override
  State<KayitSayfasi> createState() => _KayitSayfasiState();
}

class _KayitSayfasiState extends State<KayitSayfasi> {
  var _yukleniyor = false;
  var _hataMesaji = "";
  var _isimSoyisim = "";
  var _email = "";
  var _sifre = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kayıt Sayfası"),
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
              decoration: const InputDecoration(hintText: "İsim soyisim gir"),
              onChanged: (deger) {
                _isimSoyisim = deger;
                if (_hataMesaji.isNotEmpty) {
                  _hataMesaji = "";
                  setState(() {});
                }
              },
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
            const SizedBox(
              height: 24,
            ),
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
            if (_yukleniyor)
              const CircularProgressIndicator()
            else
              TextButton(
                  onPressed: () {
                    if (_email.isNotEmpty &&
                        _sifre.isNotEmpty &&
                        _isimSoyisim.isNotEmpty) {
                      _yukleniyor = true;
                      setState(() {});
                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                        email: _email,
                        password: _sifre,
                      )
                          .catchError(
                        // ignore: body_might_complete_normally_catch_error
                        (hataMesaji) {
                          _hataMesaji = hataMesaji.toString();
                          _yukleniyor = false;
                          setState(() {});
                        },
                      ).then((value) async {
                        final uid = value.user?.uid;
                        final userData = {
                          'name': _isimSoyisim,
                          'email': _email,
                          'kayitTarihi': FieldValue.serverTimestamp(),
                        };
                        if (uid == null) {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .add(userData);
                        } else {
                          await FirebaseFirestore.instance
                              .collection("users")
                              .doc(uid)
                              .set(userData);
                        }
                        if (mounted) Navigator.of(context).pop();
                      });
                    } else {
                      _hataMesaji =
                          "Email adresi, şifre veya isim boş geçilemez!";
                      setState(() {});
                    }
                  },
                  child: const Text("Kayıt Ol"))
          ],
        ),
      ),
    );
  }
}
