import 'package:flutter/material.dart';

class AnasayfaKucukBaslikWidget extends StatelessWidget {
  const AnasayfaKucukBaslikWidget({super.key, required this.kucukBaslik});

  final String kucukBaslik;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            kucukBaslik,
            style: const TextStyle(
              color: Color(0xFF1F2937),
              fontSize: 14,
              fontFamily: "Inter",
              fontWeight: FontWeight.w600,
              height: 0.11,
              letterSpacing: 0.07,
            ),
          ),
          const Spacer(),
          const Text(
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
    );
  }
}
