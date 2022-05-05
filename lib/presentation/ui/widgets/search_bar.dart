import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentation/ui/vm/coin_vm.dart';
import 'package:flutter_application_3/presentation/ui/widgets/field_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:just_debounce_it/just_debounce_it.dart';

class SearchBar extends HookConsumerWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEnabled = ref.watch(getCoinProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
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
        onChanged: (value) {
          print(value);
          Debounce.seconds(
              1, () => ref.read(getCoinProvider.notifier).searchBy(value));
          print(value);
        },
        onEditingComplete: () => FocusScope.of(context).unfocus(),
      ),
    );
  }
}
