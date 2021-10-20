import 'package:flutter/material.dart';
import 'package:flutter_application_3/presentation/ui/live_statistic.dart';
import 'package:flutter_application_3/presentation/ui/vm/coin_vm.dart';
import 'package:flutter_application_3/presentation/ui/widgets/appbar.dart';
import 'package:flutter_application_3/presentation/ui/widgets/coins_list.dart';
import 'package:flutter_application_3/presentation/ui/widgets/field_input.dart';
import 'package:flutter_application_3/presentation/ui/widgets/header_row.dart';
import 'package:flutter_application_3/utils/navigator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LivePrice extends HookConsumerWidget {
  const LivePrice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(getCoinProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        flexibleSpace: SafeArea(
          child: BarRow(
            text: "Live Prices",
            icons: Icons.notifications_outlined,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HeaderRow(
                  text1: "Market Cap",
                  text2: "\$1.6B",
                  text3: "0.00%",
                ),
                HeaderRow(
                  text1: "24h Volumne",
                  text2: "\$1.6B",
                  text3: "0.00%",
                ),
                HeaderRow(
                  text1: "BTC Dominance",
                  text2: "\$1.6B",
                  text3: "0.00%",
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            SingleChildScrollView(
              child: TextField(
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 17, horizontal: 10)),
              ),
            ),
            SizedBox(
              height: 30,
            ),

            vm.when(idle: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, success: (data) {
              return Container(
                height: 400,
                child: ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        height: 30,
                      );
                    },
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LiveStats()));
                          },
                          child: CoinsList());
                    }),
              );
            }, error: (Object error, StackTrace? stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            }),

            // CoinsList()
          ],
        ),
      ),
    );
  }
}
