import 'package:cps_mobile/features/home/data/models/user_model.dart';
import 'package:cps_mobile/features/home/presentation/widgets/user_widget.dart';
import 'package:flutter/material.dart';

class UserListWidget extends StatelessWidget {
  final List<UserModel> users;
  const UserListWidget({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, i) => UserWidget(
        user: users[i],
      ),
      separatorBuilder: (context, i) => const SizedBox(
        height: 10,
      ),
      itemCount: users.length,
    );
  }
}
