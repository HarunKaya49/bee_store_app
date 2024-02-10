import 'dart:math';

import 'package:bee_store/Par%C3%A7alar/anasayfa_urun_widget.dart';
import 'package:bee_store/Par%C3%A7alar/app_bottom_navigation_bar.dart';
import 'package:bee_store/Par%C3%A7alar/app_drawer.dart';
import 'package:bee_store/Parçalar/anasayfa_katagori_widget.dart';
import 'package:bee_store/firebase_options.dart';
import 'package:bee_store/urun_detay_ekrani.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:bee_store/Par%C3%A7alar/anasayfa_kucuk_baslik_widget.dart';
import "package:bee_store/firebase_options.dart";

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  //Kalan süre değişkeni
  late Duration _timeUntilTarget;
  //pageView conterller değişkeni
  final PageController controller = PageController(initialPage: 0);
  //pageView in bulunduğu sayfayı kontol için değişken
  int currentPage = 0;
  //slider noktaları
  late Color dot1 = Color.fromRGBO(29, 78, 216, 1);
  late Color dot2 = Colors.grey;
  late Color dot3 = Colors.grey;
  late Color dot4 = Colors.grey;
  late Color dot5 = Colors.grey;
  //Slider otomatik kayması için sayaç
  int sayac = 0;

  @override
  void initState() {
    super.initState();

    //Hedef an
    DateTime targetDate = DateTime(2024, 2, 30, 11);

    //Tekrar dedin sayaç(zamana bağlı işlemler için)
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        int nextPage = (controller.page?.round() ?? 0) + 1;
        if (nextPage > 4) {
          nextPage = 0;
        }
        if (sayac == 8) {
          controller.animateToPage(nextPage,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
          sayac = 0;
        }
        sayac++;
        _timeUntilTarget = targetDate.difference(DateTime.now());
      });
    });

    //Hedef ana kalan sürenin hesaplandığı yer
    _timeUntilTarget = targetDate.difference(DateTime.now());

    // Sayfa değiştiği andaki işlemler
    controller.addListener(() {
      setState(() {
        currentPage = controller.page?.round() ?? 0;
        switch (currentPage) {
          case 0:
            dot1 = Color.fromRGBO(29, 78, 216, 1);
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Colors.grey;
          case 1:
            dot1 = Colors.grey;
            dot2 = Color.fromRGBO(29, 78, 216, 1);
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Colors.grey;
          case 2:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Color.fromRGBO(29, 78, 216, 1);
            dot4 = Colors.grey;
            dot5 = Colors.grey;
          case 3:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Color.fromRGBO(29, 78, 216, 1);
            dot5 = Colors.grey;
          case 4:
            dot1 = Colors.grey;
            dot2 = Colors.grey;
            dot3 = Colors.grey;
            dot4 = Colors.grey;
            dot5 = Color.fromRGBO(29, 78, 216, 1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(50, 25, 155, 120),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Image.asset(
              "varliklar/resimler/notification.png",
              width: 24.5,
              height: 24.5,
            ),
            onPressed: () {},
          ),
          IconButton(
              icon: Image.asset(
                "varliklar/resimler/bag.png",
                width: 24.5,
                height: 24.5,
              ),
              onPressed: () {})
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            //Arama Butonu
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Search Anything...",
                  prefixIcon: Image.asset(
                    "varliklar/resimler/search-normal.png",
                    height: 10,
                    width: 10,
                  ),
                  border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      borderSide:
                          BorderSide(color: Color(0xFFD1D5DB), width: 1)),
                ),
              ),
            ),
            //Katagoriler
            AnasayfaKucukBaslikWidget(kucukBaslik: "Categories"),
            const SizedBox(height: 16),
            //Katagori Resimler (Kaydırma)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder(
                  future:
                      FirebaseFirestore.instance.collection("categories").get(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      final categoryList =
                          snapshot.data!.docs.map((e) => e.data()).toList();
                      return Row(
                        children: [
                          const SizedBox(width: 6),
                          for (final data in categoryList)
                            AnasayfaKatagoriWidget(
                              title: data['name'],
                              imageUrl: data['imageUrl'],
                            ),
                          for (final data in categoryList)
                            AnasayfaKatagoriWidget(
                              title: data['name'],
                              imageUrl: data['imageUrl'],
                            ),
                          SizedBox(
                            width: 4,
                          )
                        ],
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            const SizedBox(height: 16),
            //Slider
            SizedBox(
              width: 360,
              height: 154,
              child: PageView(
                controller: controller,
                children: <Widget>[
                  Center(
                    child: Image.asset("varliklar/resimler/Slider1.png"),
                  ),
                  Center(
                    child: Image.asset("varliklar/resimler/Slider2.jpg"),
                  ),
                  Center(
                    child: Image.asset("varliklar/resimler/Slider3.jpg"),
                  ),
                  Center(
                    child: Image.asset("varliklar/resimler/Slider4.jpg"),
                  ),
                  Center(
                    child: Image.asset("varliklar/resimler/Slider5.jpg"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot2,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Icon(
                      Icons.circle,
                      size: 6,
                      color: dot5,
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
            //Deal of the day + Sayaç + Özel indirimler
            Container(
              color: const Color.fromRGBO(246, 246, 246, 1),
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AnasayfaKucukBaslikWidget(kucukBaslik: "Deal of the day"),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 2),
                          child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 239, 68, 68),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                "${_timeUntilTarget.inDays} DAY ${_timeUntilTarget.inHours % 24} HRS ${_timeUntilTarget.inMinutes % 60} MIN ${_timeUntilTarget.inSeconds % 60} SEC",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(255, 255, 255, 1),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Image.asset(
                                            "varliklar/resimler/Running.png"),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Running Shoes"),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color.fromARGB(
                                                255, 239, 68, 68),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "Upto 40% OFF",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    Column(
                                      children: [
                                        Image.asset(
                                            "varliklar/resimler/Sneakers.png"),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text("Sneakers"),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Color.fromARGB(
                                                255, 239, 68, 68),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Text(
                                              "40-60% OFF",
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1)),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset(
                                              "varliklar/resimler/Wrist.png"),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Wrist Watches"),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromARGB(
                                                  255, 239, 68, 68),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "Upto 40% OFF",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const Spacer(),
                                      Column(
                                        children: [
                                          Image.asset(
                                              "varliklar/resimler/Speaker.png"),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text("Bluetooth Speakers"),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromARGB(
                                                  255, 239, 68, 68),
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(5.0),
                                              child: Text(
                                                "40-60% OFF",
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        255, 255, 255, 1)),
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            //Hot Selling Footwear
            AnasayfaKucukBaslikWidget(kucukBaslik: "Hot Selling Footwear"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AnasayfaUrunWidget(
                    resimAdresi: "varliklar/resimler/Adidas1.png",
                    baslik: "Adidas white sneakers for men",
                    usdFiyat: 68,
                    indirimOrani: 20,
                    indirimsizFiyat: 136,
                    puan: 4.8,
                    degerlendirmeSayisi: 692,
                    topSellerVarMi: true,
                    favorideMi: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AnasayfaUrunWidget(
                    resimAdresi: "varliklar/resimler/Nike1.png",
                    baslik: "Nike black running shoes for men",
                    usdFiyat: 75,
                    indirimOrani: 20,
                    indirimsizFiyat: 90,
                    puan: 4.2,
                    degerlendirmeSayisi: 412,
                    topSellerVarMi: false,
                    favorideMi: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AnasayfaUrunWidget(
                    resimAdresi: "varliklar/resimler/NikeSky2.png",
                    baslik: "Nike sky blue & white Sneakers",
                    usdFiyat: 137,
                    indirimOrani: 25,
                    indirimsizFiyat: 171.25,
                    puan: 4.0,
                    degerlendirmeSayisi: 124,
                    topSellerVarMi: true,
                    favorideMi: true,
                  ),
                )
              ]),
            ),
            SizedBox(height: 20),
            // Recommended for you
            AnasayfaKucukBaslikWidget(kucukBaslik: "Recommended for you"),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AnasayfaUrunWidget(
                    resimAdresi: "varliklar/resimler/allen.png",
                    baslik: "Allen Solly Regular fit cotton shirt",
                    usdFiyat: 35,
                    indirimOrani: 15,
                    indirimsizFiyat: 40.25,
                    puan: 4.4,
                    degerlendirmeSayisi: 412,
                    topSellerVarMi: true,
                    favorideMi: true,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: AnasayfaUrunWidget(
                    resimAdresi: "varliklar/resimler/calvin.png",
                    baslik: "Calvin Clein Regular fit slim fit shirt",
                    usdFiyat: 52,
                    indirimOrani: 20,
                    indirimsizFiyat: 62.4,
                    puan: 4.2,
                    degerlendirmeSayisi: 214,
                    topSellerVarMi: false,
                    favorideMi: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: AnasayfaUrunWidget(
                    resimAdresi: "varliklar/resimler/h&m.png",
                    baslik: "H&M half regular fit cotton shirt",
                    usdFiyat: 60,
                    indirimOrani: 25,
                    indirimsizFiyat: 75,
                    puan: 4.0,
                    degerlendirmeSayisi: 254,
                    topSellerVarMi: true,
                    favorideMi: true,
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
      drawer: const AppDrawer(),
      bottomNavigationBar: const AppBottomNavBar(),
    );
  }
}
