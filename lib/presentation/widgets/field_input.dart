import 'package:flutter/material.dart';

InputDecoration fieldInputDecoration(
    {String? labelText,
    Widget? suffixIcon,
    Widget? prefixIcon,
    String? hintText,
    EdgeInsetsGeometry? contentPadding}) {
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    fillColor: Colors.grey.withOpacity(0.20),
    filled: true,
    labelStyle: const TextStyle(color: Colors.white),
    errorStyle: const TextStyle(),
    errorMaxLines: 4,
    helperMaxLines: 4,
    contentPadding: contentPadding,
    enabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    disabledBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    focusedErrorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    errorBorder: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
}
