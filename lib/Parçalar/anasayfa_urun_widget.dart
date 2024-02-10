import 'package:flutter/material.dart';

class AnasayfaUrunWidget extends StatefulWidget {
  const AnasayfaUrunWidget(
      {super.key,
      required this.baslik,
      required this.resimAdresi,
      required this.usdFiyat,
      required this.indirimOrani,
      required this.indirimsizFiyat,
      required this.puan,
      required this.degerlendirmeSayisi,
      required this.topSellerVarMi,
      required this.favorideMi});

  final String baslik;
  final String resimAdresi;
  final double usdFiyat;
  final double indirimsizFiyat;
  final double indirimOrani;
  final double puan;
  final int degerlendirmeSayisi;
  final bool topSellerVarMi;
  final bool favorideMi;

  @override
  State createState() => _AnasayfaUrunWidgetState();

  // Uzun hali
  // State createState(){
  //   return _AnasayfaUrunWidgetState();
  // }
}

// String resimAdresi = "varliklar/resimler/Adidas1.png";
// String baslik = "Adidas white sneakers for men";
// double usdFiyat = 68.5;
// bool favorideMi = false;
// double indirimOrani = 50;

/*
var
final
const
*/

// access modifier
class _AnasayfaUrunWidgetState extends State<AnasayfaUrunWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      shadowColor: Colors.white,
      child: Column(children: [
        Stack(
          children: [
            Image.asset(
              widget.resimAdresi,
            ),
            Positioned.fill(
              top: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      if (widget.topSellerVarMi)
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color.fromRGBO(234, 88, 12, 1),
                              ),
                              width: 56,
                              height: 19,
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 4),
                                child: Text("Top Seller",
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    )),
                              )),
                        ),
                      const Spacer(),
                      if (widget.favorideMi)
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.64)),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.favorite,
                                  color: Color.fromRGBO(239, 68, 68, 1),
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white.withOpacity(0.64)),
                            child: const Center(
                              child: Padding(
                                padding: EdgeInsets.all(4.0),
                                child: Icon(
                                  Icons.favorite_border_rounded,
                                  size: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(
          width: 150,
          child: Column(
            children: [
              Text(
                widget.baslik,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "\$${widget.usdFiyat}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "\$${widget.indirimsizFiyat}",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                            color: Color.fromRGBO(156, 163, 175, 1)),
                      ),
                    ),
                    Text("${widget.indirimOrani}% OFF",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(234, 88, 12, 1))),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(children: [
                  Container(
                      width: 16,
                      height: 16,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(4),
                        color: Color.fromRGBO(245, 158, 11, 1),
                      ),
                      child: Center(
                          child:
                              Icon(Icons.star, color: Colors.white, size: 12))),
                  if (widget.puan % 1 == 0)
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text("${widget.puan}.0"),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(widget.puan.toString()),
                    ),
                  Text("(${widget.degerlendirmeSayisi})")
                ]),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
