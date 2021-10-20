import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentation/ui/live_statistic.dart';
import 'package:flutter_application_3/utils/navigator.dart';

class CoinsList extends StatelessWidget {
  const CoinsList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.grey.withOpacity(0.15),
        ),
        SizedBox(width: 15,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "grace",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 8,),
            Text(
              "ggff",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ],
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "grace",
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(height: 8,),
            Text(
              "ggff",
              style: TextStyle(color: Colors.greenAccent, fontSize: 13),
            ),
          ],
        )
      ],
    );
  }
}