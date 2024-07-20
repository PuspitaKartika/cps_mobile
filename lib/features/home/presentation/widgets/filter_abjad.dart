import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_list/user_list_bloc.dart';

class FilterAbjad extends StatefulWidget {
  const FilterAbjad({super.key});

  @override
  State<FilterAbjad> createState() => _FilterAbjadState();
}

class _FilterAbjadState extends State<FilterAbjad> {
  int _clickCount = 0;

  void _toggleOrder() {
    setState(() {
      _clickCount = (_clickCount + 1) % 3;
    });
    _applyFilter();
  }

  void _applyFilter() {
    switch (_clickCount) {
      case 1:
        context.read<UserListBloc>().add(SortUserListByAZ());
        break;
      case 2:
        context.read<UserListBloc>().add(SortUserListByZA());
        break;
      default:
        context.read<UserListBloc>().add(LoadUserList());
    }
  }

  @override
  Widget build(BuildContext context) {
    String buttonText;
    switch (_clickCount) {
      case 0:
        buttonText = "A-Z || Z-A";
        break;
      case 1:
        buttonText = "A-Z";
        break;
      case 2:
        buttonText = "Z-A";
        break;
      default:
        buttonText = "A-Z || Z-A";
    }
    return ElevatedButton(
      onPressed: _toggleOrder,
      child: Text(buttonText),
    );
  }
}
