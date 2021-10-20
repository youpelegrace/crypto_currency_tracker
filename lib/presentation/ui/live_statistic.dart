import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentation/ui/widgets/appbar.dart';
import 'package:flutter_application_3/presentation/ui/widgets/live_chart.dart';

class LiveStats extends StatelessWidget {
  const LiveStats({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        flexibleSpace: SafeArea(
          child: BarRow(
            text: "BRG/BTC",
            icons: Icons.share 
          ),
        ),
      ),
      body: Column(
        children: [
           Text(
              "\$108.84",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            SizedBox(height: 20,),
            Text(
              "\$50.66",
              style: TextStyle(color: Colors.greenAccent, fontSize: 13),
            ),
            SizedBox(height: 50,),
          StatsChart()
        ],
      ),
    );
  }
}