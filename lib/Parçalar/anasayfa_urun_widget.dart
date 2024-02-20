import 'package:bee_store/cubitler/favori_cubit.dart';
import 'package:bee_store/cubitler/sepet_cubit.dart';
import 'package:bee_store/modeller/urun_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaUrunWidget extends StatefulWidget {
  const AnasayfaUrunWidget({
    super.key,
    required this.urun,
  });

  final UrunModel urun;

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
            Image.network(
              widget.urun.resimAdresi,
            ),
            Positioned.fill(
              top: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      if (widget.urun.topSellerVarMi)
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
                      BlocBuilder<FavoriCubit, List<String>>(
                        builder: (_, favori) {
                          final isFavorite = favori.contains(widget.urun.uid);
                          return IconButton(
                            onPressed: () {
                              context
                                  .read<FavoriCubit>()
                                  .favoriyeUrunEkleCikar(widget.urun.uid);
                            },
                            icon: isFavorite
                                ? const Icon(
                                    Icons.favorite,
                                    color: Color.fromRGBO(239, 68, 68, 1),
                                    size: 20,
                                  )
                                : const Icon(
                                    Icons.favorite_border_rounded,
                                    size: 20,
                                  ),
                          );
                        },
                      )
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
                widget.urun.baslik,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "\$${(widget.urun.usdFiyat * (1 - widget.urun.indirimOrani)).toInt()}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "\$${widget.urun.usdFiyat}",
                        style: const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            fontSize: 12,
                            color: Color.fromRGBO(156, 163, 175, 1)),
                      ),
                    ),
                    Text("${(widget.urun.indirimOrani * 100.toInt())}% OFF",
                        style: const TextStyle(
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
                        color: const Color.fromRGBO(245, 158, 11, 1),
                      ),
                      child: const Center(
                          child:
                              Icon(Icons.star, color: Colors.white, size: 12))),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text((widget.urun.puan % 1 == 0)
                        ? "${widget.urun.puan}.0"
                        : widget.urun.puan.toString()),
                  ),
                  Text("(${widget.urun.degerlendirmeSayisi})"),
                  const Spacer(),
                  BlocBuilder<SepetCubit, List<String>>(builder: (_, sepet) {
                    final inCart = sepet.contains(widget.urun.uid);

                    return IconButton(
                      onPressed: () {
                        context
                            .read<SepetCubit>()
                            .sepeteUrunEkleCikar(widget.urun.uid);
                      },
                      icon: Icon(
                        inCart
                            ? Icons.shopping_bag
                            : Icons.shopping_bag_outlined,
                      ),
                    );
                  })
                ]),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
