import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_list/user_list_bloc.dart';

class FilterAbjadWidget extends StatefulWidget {
  final Function(SortOrder?) onSortOerderChanged;

  const FilterAbjadWidget({
    super.key,
    required this.onSortOerderChanged,
  });

  @override
  State<FilterAbjadWidget> createState() => _FilterAbjadWidgetState();
}

class _FilterAbjadWidgetState extends State<FilterAbjadWidget> {
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
        widget.onSortOerderChanged(SortOrder.AZ);
        break;
      case 2:
        widget.onSortOerderChanged(SortOrder.ZA);
        break;
      default:
        context.read<UserListBloc>().add(const LoadUserList(""));
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
