import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:cps_mobile/features/home/data/models/city_model.dart';
import 'package:cps_mobile/features/home/presentation/bloc/user_list/user_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCity extends StatefulWidget {
  final List<CityModel> items;

  const FilterCity({
    super.key,
    required this.items,
  });

  @override
  State<FilterCity> createState() => _FilterCityState();
}

class _FilterCityState extends State<FilterCity> {
  String? selectedKota;

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
        items: widget.items.map((CityModel city) {
          return DropdownMenuItem<String>(
            value: city.name,
            child: Text(city.name),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectedKota = newValue;
            context.read<UserListBloc>().add(FilterUserListByCity(newValue!));
          });
        },
        selectedItemBuilder: (BuildContext context) {
          return widget.items.map((CityModel kota) {
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
