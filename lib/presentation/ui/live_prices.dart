import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/services/model/chart_model.dart';
import 'package:flutter_application_3/core/services/model/coin_model.dart';
import 'package:flutter_application_3/presentation/ui/live_statistic.dart';
import 'package:flutter_application_3/presentation/ui/vm/coin_vm.dart';
import 'package:flutter_application_3/presentation/ui/widgets/appbar.dart';
import 'package:flutter_application_3/presentation/ui/widgets/coins_list.dart';
import 'package:flutter_application_3/presentation/ui/widgets/field_input.dart';
import 'package:flutter_application_3/presentation/ui/widgets/search_bar.dart';
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
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(children: [
          SearchBar(),
          SizedBox(
            height: 30,
          ),
          vm.when(
            idle: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
            success: (value) {
              return Expanded(
                child: ShaderMask(
                  shaderCallback: (Rect bound) {
                    return const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.purple,
                        Colors.transparent,
                        Colors.transparent,
                        Colors.purple
                      ],
                      stops: [
                        0.0,
                        0.02,
                        0.8,
                        1.0
                      ], // 10% purple, 80% transparent, 10% purple
                    ).createShader(bound);
                  },
                  blendMode: BlendMode.dstOut,
                  child: RefreshIndicator(
                    onRefresh: () async {
                      ref.refresh(getCoinProvider);
                    },
                    child: Container(
                      // height: 480,
                      child: ListView.separated(
                          separatorBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 30,
                            );
                          },
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            final item = value[index];
                            // final ChartData chartData = value[index];
                            return CoinsList(
                              btc: item,
                            );
                          }),
                    ),
                  ),
                ),
              );
            },
            error: (Object error, StackTrace? stackTrace) {
              return Center(
                child: Text(error.toString()),
              );
            },
          ),
        ]),
      ),
    );
  }
}
