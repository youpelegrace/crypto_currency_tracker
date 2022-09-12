import 'package:flutter/material.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow(
      {Key? key, required this.text1, required this.text2, required this.text3})
      : super(key: key);
  final String text1;
  final String text2;
  final String text3;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.grey, fontSize: 10),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text2,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          text3,
          style: TextStyle(color: Colors.greenAccent, fontSize: 10),
        ),
      ],
    );
  }
}
