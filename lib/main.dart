// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables

import 'package:bee_store/Par%C3%A7alar/anasayfa_urun_widget.dart';
import 'package:bee_store/Parçalar/anasayfa_katagori_widget.dart';
import 'package:bee_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import "package:bee_store/firebase_options.dart";

// Fonksiyon Tanımlamak
Future<void> main() async {
  // Fonksiyon Çağırmak
  print("İlk işlem başarılı olarak çalıştırıldı.");
  islem(selamlamaMetni, sayi);

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
    DateTime targetDate = DateTime(2024, 1, 30, 11);

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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Home'),
            backgroundColor: const Color.fromARGB(50, 25, 155, 120),
            centerTitle: false,
            actions: [
              IconButton(
                icon: Image.asset(
                  "varliklar/notification.png",
                  width: 24.5,
                  height: 24.5,
                ),
                onPressed: () {},
              ),
              IconButton(
                  icon: Image.asset(
                    "varliklar/bag.png",
                    width: 24.5,
                    height: 24.5,
                  ),
                  onPressed: () {})
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                //Arama Butonu
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: "Search Anything...",
                      prefixIcon: Image.asset(
                        "varliklar/search-normal.png",
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
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "Categories",
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          height: 0.11,
                          letterSpacing: 0.07,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All ->",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //Katagori Resimler (Kaydırma)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 16,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Fashion",
                          resimAdresi: "varliklar/FashionCart.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Electronics",
                          resimAdresi: "varliklar/ElectronicCart.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Appliances",
                          resimAdresi: "varliklar/AppliancesCart.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Beauty",
                          resimAdresi: "varliklar/BeautyCart.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Furiture",
                          resimAdresi: "varliklar/FurnitureCart.png"),
                      const SizedBox(
                        width: 16,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Fashion",
                          resimAdresi: "varliklar/FashionCart.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Electronics",
                          resimAdresi: "varliklar/ElectronicCart.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Appliances",
                          resimAdresi: "varliklar/AppliancesCart.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Beauty",
                          resimAdresi: "varliklar/BeautyCart.png"),
                      const SizedBox(
                        width: 20,
                      ),
                      AnasayfaKatagoriWidget(
                          katagoriBaslik: "Furiture",
                          resimAdresi: "varliklar/FurnitureCart.png"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                //Slider
                Container(
                  width: 360,
                  height: 154,
                  child: PageView(
                    controller: controller,
                    children: <Widget>[
                      Center(
                        child: Image.asset("Varliklar/Slider1.png"),
                      ),
                      Center(
                        child: Image.asset("Varliklar/Slider2.jpg"),
                      ),
                      Center(
                        child: Image.asset("Varliklar/Slider3.jpg"),
                      ),
                      Center(
                        child: Image.asset("Varliklar/Slider4.jpg"),
                      ),
                      Center(
                        child: Image.asset("Varliklar/Slider5.jpg"),
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 16.0),
                          child: Row(
                            children: [
                              const Text(
                                "Deal of the day",
                                style: TextStyle(
                                  color: Color(0xFF1F2937),
                                  fontSize: 14,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w600,
                                  height: 0.11,
                                  letterSpacing: 0.07,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "View All ->",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFF6B7280),
                                  fontSize: 12,
                                  fontFamily: "Inter",
                                  fontWeight: FontWeight.w400,
                                  height: 0.12,
                                ),
                              )
                            ],
                          ),
                        ),
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
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
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
                                                "varliklar/Running.png"),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                "varliklar/Sneakers.png"),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            children: [
                                              Image.asset(
                                                  "varliklar/Wrist.png"),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
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
                                                  "varliklar/Speaker.png"),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child:
                                                    Text("Bluetooth Speakers"),
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
                SizedBox(
                  height: 20,
                ),
                //Hot Selling Footwear
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Hot Selling Footwear",
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          height: 0.11,
                          letterSpacing: 0.07,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All ->",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AnasayfaUrunWidget(
                        resimAdresi: "varliklar/Adidas1.png",
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
                        resimAdresi: "varliklar/Nike1.png",
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
                        resimAdresi: "varliklar/NikeSky2.png",
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
                SizedBox(
                  height: 20,
                ),
                // Recommended for you
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "Recommended for you",
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 14,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w600,
                          height: 0.11,
                          letterSpacing: 0.07,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "View All ->",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Color(0xFF6B7280),
                          fontSize: 12,
                          fontFamily: "Inter",
                          fontWeight: FontWeight.w400,
                          height: 0.12,
                        ),
                      )
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AnasayfaUrunWidget(
                        resimAdresi: "varliklar/allen.png",
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
                        resimAdresi: "varliklar/calvin.png",
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
                        resimAdresi: "varliklar/h&m.png",
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
          drawer: Drawer(
            child: ListView(children: [
              DrawerHeader(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 35.0),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("varliklar/ProfilPhoto1.jpg")),
                            ),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            "David Guatta",
                          ),
                          Text("    +91-999999999")
                        ],
                      ),
                      const Spacer(),
                      const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.0),
                            child: Icon(Icons.arrow_forward_ios_rounded),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const ListTile(
                leading: Icon(Icons.category),
                title: Text("Shop by Categories"),
              ),
              const ListTile(
                leading: Icon(Icons.access_time),
                title: Text("My Order"),
              ),
              const ListTile(
                leading: Icon(Icons.favorite_border),
                title: Text("Favourites"),
              ),
              const ListTile(
                leading: Icon(Icons.live_help_outlined),
                title: Text("FAQs"),
              ),
              const ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text("Addresses"),
              ),
              const ListTile(
                leading: Icon(Icons.credit_card_rounded),
                title: Text("Saved Cards"),
              ),
              const ListTile(
                leading: Icon(Icons.insert_drive_file_outlined),
                title: Text("Terms & Conditions"),
              ),
              const ListTile(
                leading: Icon(Icons.privacy_tip_outlined),
                title: Text("Privacy Policy"),
              ),
              const ListTile(
                leading: Icon(Icons.logout),
                title: Text("Logout"),
              ),
            ]),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Color.fromARGB(50, 25, 155, 120),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Category",
                backgroundColor: Color.fromARGB(50, 25, 155, 120),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.access_time),
                label: "Orders",
                backgroundColor: Color.fromARGB(50, 25, 155, 120),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_pin),
                label: "Profile",
                backgroundColor: Color.fromARGB(50, 25, 155, 120),
              ),
            ],
            selectedLabelStyle: TextStyle(color: Colors.black),
            unselectedLabelStyle: TextStyle(color: Colors.black),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
          ),
        ));
  }
}

// Veri Tipleri
// Değişken Tanımlama
String selamlamaMetni = "Merhaba Arkadaşlar";

int sayi = 5;

String isim = "Serbay";
String soyisim = "Özkan";

int yas = 22;

double kilo = 70.45;

bool askerlikYaptiMi = false;

List<int> okullaGecenYillar = [2013, 2014, 2015, 2016, 2017, 2018, 2019];

Insan serbay = Insan("Serbay", "Özkan", 22, 70, false,
    [2013, 2014, 2015, 2016, 2017, 2018, 2019]);

Ogrenci tuncay = Ogrenci("Tuncay", "Özkan", 22, 7, false, okullaGecenYillar,
    "123456", "İstanbul Teknik Üniversitesi");

class Insan {
  String isim;
  String soyisim;
  int yas;
  double kilo;
  bool askerlikYaptiMi;
  List<int> okullaGecenYillar;

  Insan(this.isim, this.soyisim, this.yas, this.kilo, this.askerlikYaptiMi,
      this.okullaGecenYillar) {
    print("İnsan sınıfı oluşturuldu.");
  }
}

int dogumYiliniHesapla() {
  DateTime simdi = DateTime.now();
  return simdi.year - yas;
}

void islem(String Metin, int sayi) {
  for (int i = 0; i < sayi; i++) {
    print(Metin);
  }
}

class Ogrenci extends Insan {
  String okulNumara;
  String okulIsmi;

  Ogrenci(
      super.isim,
      super.soyisim,
      super.yas,
      super.kilo,
      super.askerlikYaptiMi,
      super.okullaGecenYillar,
      this.okulNumara,
      this.okulIsmi) {
    print("Öğrenci sınfı oluşturuldu.");
  }

  @override
  int dogumYiliniHesapla() {
    return 2002;
  }
}
