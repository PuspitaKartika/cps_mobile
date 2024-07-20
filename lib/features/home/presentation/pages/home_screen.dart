import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:cps_mobile/cores/widgets/custom_textfield.dart';
import 'package:cps_mobile/features/home/presentation/pages/add_user.dart';
import 'package:cps_mobile/features/home/presentation/widgets/filter_abjad.dart';
import 'package:cps_mobile/features/home/presentation/widgets/filter_city_card.dart';
import 'package:cps_mobile/features/home/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            CustomTextField(
              controller: searchController,
              hintText: "Search",
              icon: const Icon(Icons.search),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Row(
                children: [
                  Expanded(child: FilterCity()),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(child: FilterAbjad())
                ],
              ),
            ),
            const UserCard()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          Get.to(const AddUserScreen());
        },
        child: const Text(
          "+",
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    ));
  }
}
