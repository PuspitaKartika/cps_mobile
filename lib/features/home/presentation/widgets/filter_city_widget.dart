import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:cps_mobile/features/home/data/models/city_model.dart';
import 'package:cps_mobile/features/home/presentation/bloc/user_list/user_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterCityWidget extends StatefulWidget {
  final String? selectedKota;
  final List<CityModel> items;

  const FilterCityWidget({super.key, required this.items, this.selectedKota});

  @override
  State<FilterCityWidget> createState() => _FilterCityWidgetState();
}

class _FilterCityWidgetState extends State<FilterCityWidget> {
  String? selectedKota;

  @override
  void initState() {
    super.initState();
    selectedKota = widget.selectedKota;
  }

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
          });
          context.read<UserListBloc>().add(SearchUserList(query: newValue!));
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
