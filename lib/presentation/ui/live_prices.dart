import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/core/repository/coin_repository.dart';
import 'package:flutter_application_3/core/services/model/coin_model.dart';
import 'package:flutter_application_3/presentation/ui/vm/coin_vm.dart';
import 'package:flutter_application_3/presentation/widgets/coins_list.dart';
import 'package:flutter_application_3/presentation/widgets/field_input.dart';
import 'package:flutter_application_3/presentation/widgets/shimmer.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LivePrice extends StatefulHookConsumerWidget {
  const LivePrice({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LivePriceState();
}

class _LivePriceState extends ConsumerState<LivePrice> {
  List<Btc> btc = [];
  List<Btc> filterableBtc = [];

  Future<List<Btc>> filterClients(
      {required List<Btc> btcs, required String text}) {
    if (text.isEmpty) {
      btcs = btc;
      return Future.value(btcs);
    }
    List<Btc> result =
        btcs.where((element) => element.name!.contains(text)).toList();

    return Future.value(result);
  }

  void _filterClients(String text) async {
    filterableBtc = await filterClients(btcs: btc, text: text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(getCoinProvider);
    // final listState = useState("");

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Text(
          "Live Prices",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          children: [
            Padding(
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
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 17, horizontal: 10)),
                onChanged: (value) {
                  EasyDebounce.debounce("search", Duration(milliseconds: 500),
                      () {
                    ref.read(getCoinProvider.notifier).searchBy(value);
                  });
                },
              ),
            ),
            // listState.value.isNotEmpty
            //     ? Expanded(
            //         child: ShaderMask(
            //           shaderCallback: (Rect bound) {
            //             return const LinearGradient(
            //               begin: Alignment.topCenter,
            //               end: Alignment.bottomCenter,
            //               colors: [
            //                 Colors.purple,
            //                 Colors.transparent,
            //                 Colors.transparent,
            //                 Colors.purple
            //               ],
            //               stops: [
            //                 0.0,
            //                 0.02,
            //                 0.8,
            //                 1.0
            //               ], // 10% purple, 80% transparent, 10% purple
            //             ).createShader(bound);
            //           },
            //           blendMode: BlendMode.dstOut,
            //           child: RefreshIndicator(
            //             onRefresh: () async {
            //               ref.refresh(getCoinProvider);
            //             },
            //             child: Container(
            //               margin: EdgeInsets.only(top: 20),
            //               child: ListView.separated(
            //                   separatorBuilder:
            //                       (BuildContext context, int index) {
            //                     return SizedBox(
            //                       height: 30,
            //                     );
            //                   },
            //                   physics: BouncingScrollPhysics(),
            //                   scrollDirection: Axis.vertical,
            //                   shrinkWrap: true,
            //                   itemCount: filterableBtc.length,
            //                   itemBuilder: (context, index) {
            //                     final item = filterableBtc[index];
            //                     // final ChartData chartData = value[index];
            //                     // if (filterableBtc.isNotEmpty) {
            //                     //   return Text(
            //                     //     'List is empty',
            //                     //     style: TextStyle(
            //                     //       fontSize: 30,
            //                     //       color: Colors.white,
            //                     //     ),
            //                     //   );
            //                     // } else {
            //                     //   return
            //                     return CoinsList(
            //                       btc: item,
            //                     );
            //                   }
            //                   // }
            //                   ),
            //             ),
            //           ),
            //         ),
            //       )
            // :
            vm.when(
              idle: () {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
              loading: () {
                return loadingShimmer();
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
                        margin: EdgeInsets.only(top: 20),
                        child: ListView.separated(
                            separatorBuilder:
                                (BuildContext context, int index) {
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
                              // if (filterableBtc.isEmpty) {
                              //   return Text(
                              //     '2nd if List is empty',
                              //     style: TextStyle(
                              //       fontSize: 30,
                              //       color: Colors.white,
                              //     ),
                              //   );
                              // } else {
                              return CoinsList(
                                btc: item,
                              );
                            }
                            // }
                            ),
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
            )
          ],
        ),
      ),
    );
  }
}

Widget loadingShimmer() {
  return Expanded(
    child: ListView.builder(
        itemCount: 9,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              top: 20,
              bottom: 40,
            ),
            child: Row(
              children: [
                ShimmerWidget.circular(
                  height: 40,
                  width: 40,
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    children: [
                      ShimmerWidget.rectanglar(
                        height: 20,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ShimmerWidget.rectanglar(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
  );
}
