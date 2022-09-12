import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/services/model/coin_model.dart';
import 'package:flutter_application_3/presentation/widgets/field_input.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    this.onTextEntered,
    Key? key,
  }) : super(key: key);
  final ValueChanged<String>? onTextEntered;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: fieldInputDecoration(
            labelText: "Search...",
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            suffixIcon: Icon(
              Icons.swap_horiz,
              color: Colors.white,
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 17, horizontal: 10)),
        onChanged: onTextEntered,
        // (value) {
        //   _filterClients(value);
        //   listState.value = value;
        // },
        onEditingComplete: () => FocusScope.of(context).unfocus(),
      ),
    );
  }
}
