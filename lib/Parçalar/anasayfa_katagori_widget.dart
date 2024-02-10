import 'package:flutter/material.dart';

class AnasayfaKatagoriWidget extends StatelessWidget {
  const AnasayfaKatagoriWidget({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(title),
          ),
        ],
      ),
    );
  }
}
