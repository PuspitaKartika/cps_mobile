import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:cps_mobile/cores/widgets/custom_textfield.dart';
import 'package:cps_mobile/features/home/presentation/bloc/city_list/city_list_bloc.dart';
import 'package:cps_mobile/features/home/presentation/bloc/user_list/user_list_bloc.dart';
import 'package:cps_mobile/features/home/presentation/pages/add_user.dart';
import 'package:cps_mobile/features/home/presentation/widgets/filter_abjad.dart';
import 'package:cps_mobile/features/home/presentation/widgets/filter_city_card.dart';
import 'package:cps_mobile/features/home/presentation/widgets/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<UserListBloc>().add(LoadUserList());
    context.read<CityListBloc>().add(LoadCityList());
  }

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
              child: Row(
                children: [
                  Expanded(child: BlocBuilder<CityListBloc, CityListState>(
                    builder: (context, state) {
                      if (state is CityListLoaded) {
                        if (state.item.isEmpty) {
                          return const Center(
                            child: Text("Kota Kosong"),
                          );
                        } else {
                          return FilterCity(items: state.item);
                        }
                      } else if (state is CityListError) {
                        return const Center(
                          child: Text("Kota Kosong"),
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  const Expanded(child: FilterAbjad())
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<UserListBloc, UserListState>(
                  builder: (context, state) {
                if (state is UserListLoaded) {
                  if (state.user.isEmpty) {
                    return Center(
                      child: Column(
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
                      ),
                    );
                  } else {
                    return ListView.separated(
                        itemBuilder: (context, i) => UserCard(
                              user: state.user[i],
                            ),
                        separatorBuilder: (context, i) => const SizedBox(
                              height: 10,
                            ),
                        itemCount: state.user.length);
                  }
                } else if (state is UserListError) {
                  return Center(
                    child: Text(state.error),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
            )
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
