import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class EmptyUserWidget extends StatelessWidget {
  const EmptyUserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          "assets/image.png",
          width: 144,
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          textAlign: TextAlign.center,
          "Data kosong!!!, \nTambahkan data user",
          style: TextStyle(color: kPrimaryColor),
        )
      ],
    );
  }
}
