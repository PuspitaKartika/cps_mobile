import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:flutter/material.dart';

class FilterCity extends StatefulWidget {
  const FilterCity({super.key});

  @override
  State<FilterCity> createState() => _FilterCityState();
}

class _FilterCityState extends State<FilterCity> {
  String? selectedKota;
  final List<String> kotaList = [
    "Jakarta",
    "Surabaya",
    "Bandung",
    "Medan",
    "Yogyakarta"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: selectedKota,
        hint: const Row(
          children: [
            Icon(Icons.filter_list),
            SizedBox(width: 10),
            Text("Pilih Kota"),
          ],
        ),
        icon: const Icon(Icons.arrow_drop_down),
        underline: const SizedBox(),
        items: kotaList.map((String kota) {
          return DropdownMenuItem<String>(
            value: kota,
            child: Text(kota),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedKota = newValue;
          });
        },
        selectedItemBuilder: (BuildContext context) {
          return kotaList.map((String kota) {
            return Container(
              alignment: Alignment.centerLeft,
              child: Text(
                selectedKota ?? "Pilih Kota",
                style: const TextStyle(
                  color: kBlackColor,
                ),
              ),
            );
          }).toList();
        },
      ),
    );
  }
}
