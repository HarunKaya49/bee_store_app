import 'package:flutter/material.dart';

class AnasayfaKatagoriWidget extends StatefulWidget {
  const AnasayfaKatagoriWidget({
    super.key,
    required this.katagoriBaslik,
    required this.resimAdresi,
  });

  final String katagoriBaslik;
  final String resimAdresi;

  @override
  State createState() => _AnasayfaKatagoriWidgetState();
}

class _AnasayfaKatagoriWidgetState extends State<AnasayfaKatagoriWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(widget.resimAdresi),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(widget.katagoriBaslik),
        ),
      ],
    );
  }
}
