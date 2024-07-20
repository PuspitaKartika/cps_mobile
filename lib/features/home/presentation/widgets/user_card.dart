import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 4,
                color: kPrimaryColor,
              )
            ]),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            width: 80,
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: kPrimaryColor),
            child: const Center(
                child: Text(
              "A",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 36),
            )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Aku",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                _tableCustom("Email", "example@gmail.com"),
                _tableCustom("Nomor Hp", "081123456789"),
                _tableCustom("Kota", "Tangerang"),
                _tableCustom("Alamat", "Alamat ini panjang")
              ],
            ),
          ),
        ]));
  }

  Widget _tableCustom(String key, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              key,
            )),
        const Text(": "),
        Expanded(flex: 2, child: Text(value))
      ],
    );
  }
}
