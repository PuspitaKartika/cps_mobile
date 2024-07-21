import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:cps_mobile/cores/utils/formatter/capitalize_formatter.dart';
import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:flutter/material.dart';

class UserWidget extends StatelessWidget {
  final UserModel user;
  const UserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
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
            child: Center(
                child: Text(
              user.name[0].toUpperCase(),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 36),
            )),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CapitalizeFormatter.capitalize(user.name),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                _tableCustom("Email", user.email),
                _tableCustom("Nomor Hp", user.phoneNumber),
                _tableCustom("Kota", user.city),
                _tableCustom("Alamat", user.address)
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
