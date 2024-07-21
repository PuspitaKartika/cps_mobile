import 'package:cps_mobile/cores/utils/constant/colors.dart';
import 'package:cps_mobile/cores/widgets/custom_textfield.dart';
import 'package:cps_mobile/features/home/presentation/bloc/city_list/city_list_bloc.dart';
import 'package:cps_mobile/features/home/presentation/bloc/user_list/user_list_bloc.dart';
import 'package:cps_mobile/features/home/presentation/pages/add_user.dart';
import 'package:cps_mobile/features/home/presentation/widgets/empty_user_widgets.dart';
import 'package:cps_mobile/features/home/presentation/widgets/filter_abjad_widget.dart';
import 'package:cps_mobile/features/home/presentation/widgets/filter_city_widget.dart';
import 'package:cps_mobile/features/home/presentation/widgets/user_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  String? selectedCity;
  SortOrder? selectedSortOrder;
  @override
  void initState() {
    super.initState();
    context.read<UserListBloc>().add(LoadUserList(searchController.text));
    context.read<CityListBloc>().add(LoadCityList());
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  void _loadUserList() {
    context.read<UserListBloc>().add(
          SortAndFilterUserList(sortOrder: selectedSortOrder),
        );
  }

  void _onSearchChanged() {
    context.read<UserListBloc>().add(LoadUserList(searchController.text));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          children: [
            CustomTextField(
              onChanged: (value) => _onSearchChanged(),
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
                          return FilterCityWidget(
                            items: state.item,
                          );
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
                  Expanded(child: FilterAbjadWidget(
                    onSortOerderChanged: (sortOrder) {
                      setState(() {
                        selectedSortOrder = sortOrder;
                        _loadUserList();
                      });
                    },
                  ))
                ],
              ),
            ),
            Expanded(
              child: BlocBuilder<UserListBloc, UserListState>(
                builder: (context, state) {
                  if (state is UserListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is UserListError) {
                    return Center(
                      child: Text(state.error),
                    );
                  } else if (state is UserListLoaded) {
                    if (state.user.isEmpty) {
                      return const EmptyUserWidget();
                    } else {
                      return UserListWidget(
                        users: state.user,
                      );
                    }
                  } else if (state is UserFilterByCity) {
                    if (state.user.isEmpty) {
                      return const EmptyUserWidget();
                    } else {
                      return UserListWidget(users: state.user);
                    }
                  } else if (state is UserListSearch) {
                    if (state.user.isEmpty) {
                      return const EmptyUserWidget();
                    } else {
                      return UserListWidget(users: state.user);
                    }
                  }
                  return const SizedBox();
                },
              ),
            ),
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
