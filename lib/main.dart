import 'package:bee_store/sayfalar/yuklenme_sayfasi.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'firebase_options.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FlutterNativeSplash.remove();

  runApp(const YuklenmeSayfasi());
}

// Veri Tipleri
// Değişken Tanımlama
// String selamlamaMetni = "Merhaba Arkadaşlar";

// int sayi = 5;

// String isim = "Serbay";
// String soyisim = "Özkan";

// int yas = 22;

// double kilo = 70.45;

// bool askerlikYaptiMi = false;

// List<int> okullaGecenYillar = [2013, 2014, 2015, 2016, 2017, 2018, 2019];

// Insan serbay = Insan("Serbay", "Özkan", 22, 70, false,
//     [2013, 2014, 2015, 2016, 2017, 2018, 2019]);

// Ogrenci tuncay = Ogrenci("Tuncay", "Özkan", 22, 7, false, okullaGecenYillar,
//     "123456", "İstanbul Teknik Üniversitesi");

// class Insan {
//   String isim;
//   String soyisim;
//   int yas;
//   double kilo;
//   bool askerlikYaptiMi;
//   List<int> okullaGecenYillar;

//   Insan(this.isim, this.soyisim, this.yas, this.kilo, this.askerlikYaptiMi,
//       this.okullaGecenYillar) {
//     print("İnsan sınıfı oluşturuldu.");
//   }
// }

// int dogumYiliniHesapla() {
//   DateTime simdi = DateTime.now();
//   return simdi.year - yas;
// }

// void islem(String Metin, int sayi) {
//   for (int i = 0; i < sayi; i++) {
//     print(Metin);
//   }
// }

// class Ogrenci extends Insan {
//   String okulNumara;
//   String okulIsmi;

//   Ogrenci(
//       super.isim,
//       super.soyisim,
//       super.yas,
//       super.kilo,
//       super.askerlikYaptiMi,
//       super.okullaGecenYillar,
//       this.okulNumara,
//       this.okulIsmi) {
//     print("Öğrenci sınfı oluşturuldu.");
//   }
// }
