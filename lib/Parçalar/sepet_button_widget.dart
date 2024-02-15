import 'package:bee_store/cubitler/sepet_cubit.dart';
import 'package:bee_store/sayfalar/sepet_sayfasi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SepetIconButton extends StatelessWidget {
  const SepetIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Stack(
          children: [
            Image.asset(
              "varliklar/resimler/bag.png",
              width: 24.5,
              height: 24.5,
            ),
            Positioned.fill(
              child: BlocBuilder<SepetCubit, List<String>>(
                builder: (_, sepet) {
                  if (sepet.isEmpty) return const SizedBox();

                  return Align(
                      alignment: Alignment.topRight,
                      child: ColoredBox(
                          color: Colors.red,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text("${sepet.length}"),
                          )));
                },
              ),
            ),
          ],
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                        value: BlocProvider.of<SepetCubit>(context),
                        child: const SepetSayfasi(),
                      )));
        });
  }
}
