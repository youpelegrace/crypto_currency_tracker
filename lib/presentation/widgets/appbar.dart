import 'package:flutter/material.dart';

class BarRow extends StatelessWidget {
  const BarRow({Key? key, required this.text, required this.icons})
      : super(key: key);
  final String text;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30),
        child: Row(
          children: [
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey.withOpacity(0.15),
              child: Icon(
                icons,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
