import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/services/model/coin_model.dart';
import 'package:flutter_application_3/presentation/ui/live_statistic.dart';
import 'package:intl/intl.dart';

class CoinsList extends StatelessWidget {
  final Btc btc;
  const CoinsList({Key? key, required this.btc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var format = NumberFormat("###,###", "en_US");
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LiveStats(
                      id: btc.id!,
                      item: btc,
                    )));
      },
      child: Container(
        width: double.infinity,
        child: Row(
          children: [
            Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(1, 1))
                ],
                shape: BoxShape.circle,
              ),
              child: Container(
                margin: EdgeInsets.all(10),
                height: 40,
                width: 40,
                child: Image.network(btc.image!),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // width: 190,
                  child: Text(
                    btc.name.toString(),
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  btc.symbol.toString(),
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ],
            ),
            Spacer(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "\$" + format.format(btc.marketCap),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      btc.marketCapChangePercentage24H! > 0.0
                          ? Icon(
                              Icons.arrow_drop_up_outlined,
                              color: Colors.greenAccent[400],
                            )
                          : const Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.red,
                            ),
                      Text(
                        btc.marketCapChangePercentage24H!.toStringAsFixed(1) +
                            "%",
                        style: TextStyle(
                            color: btc.marketCapChangePercentage24H! > 0.0
                                ? Colors.greenAccent[400]
                                : Colors.red,
                            fontSize: 13),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
