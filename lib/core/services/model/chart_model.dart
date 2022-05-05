//

// To parse this JSON data, do
//
//     final coinById = coinByIdFromJson(jsonString);

import 'dart:convert';

ChartData coinByIdFromJson(String str) => ChartData.fromJson(json.decode(str));

String coinByIdToJson(ChartData data) => json.encode(data.toJson());

class ChartData {
  ChartData({
    this.id,
    this.symbol,
    required this.name,
    this.assetPlatformId,
    this.blockTimeInMinutes,
    this.hashingAlgorithm,
    this.categories,
    // this.publicNotice,
    this.additionalNotices,
    this.image,
    this.countryOrigin,
    // this.genesisDate,
    this.sentimentVotesUpPercentage,
    this.sentimentVotesDownPercentage,
    this.marketCapRank,
    this.coingeckoRank,
    this.coingeckoScore,
    this.publicInterestScore,
    this.marketData,
    this.statusUpdates,
    this.lastUpdated,
    this.tickers,
  });

  Id? id;
  String? symbol;
  String name;
  dynamic assetPlatformId;

  num? blockTimeInMinutes;
  String? hashingAlgorithm;
  List<String>? categories;
  List<dynamic>? additionalNotices;

  Image? image;
  String? countryOrigin;

  num? sentimentVotesUpPercentage;
  num? sentimentVotesDownPercentage;
  num? marketCapRank;
  num? coingeckoRank;
  num? coingeckoScore;

  num? publicInterestScore;
  MarketData? marketData;

  List<dynamic>? statusUpdates;
  DateTime? lastUpdated;
  List<Ticker>? tickers;

  factory ChartData.fromJson(Map<String, dynamic> json) => ChartData(
        id: idValues.map[json["id"]] == null ? null : idValues.map[json["id"]],
        symbol: json["symbol"] == null ? null : json["symbol"],
        name: json["name"] == null ? null : json["name"],
        assetPlatformId: json["asset_platform_id"] == null
            ? null
            : json["asset_platform_id"],
        blockTimeInMinutes: json["block_time_in_minutes"] == null
            ? null
            : json["block_time_in_minutes"],
        hashingAlgorithm: json["hashing_algorithm"] == null
            ? null
            : json["hashing_algorithm"],
        categories: List<String>.from(json["categories"].map((x) => x)) == null
            ? null
            : List<String>.from(json["categories"].map((x) => x)),
        // publicNotice:
        //     json["public_notice"] == null ? null : json["public_notice"],
        additionalNotices:
            List<dynamic>.from(json["additional_notices"].map((x) => x)) == null
                ? null
                : List<dynamic>.from(json["additional_notices"].map((x) => x)),
        image: Image.fromJson(json["image"]) == null
            ? null
            : Image.fromJson(json["image"]),
        countryOrigin:
            json["country_origin"] == null ? null : json["country_origin"],
        // genesisDate: DateTime.parse(json["genesis_date"]) == null
        //     ? null
        //     : DateTime.parse(json["genesis_date"]),
        sentimentVotesUpPercentage:
            (json["sentiment_votes_up_percentage"] as num) == null
                ? null
                : (json["sentiment_votes_up_percentage"] as num),
        sentimentVotesDownPercentage:
            (json["sentiment_votes_down_percentage"] as num) == null
                ? null
                : (json["sentiment_votes_down_percentage"] as num).toDouble(),
        marketCapRank:
            json["market_cap_rank"] == null ? null : json["market_cap_rank"],
        coingeckoRank:
            json["coingecko_rank"] == null ? null : json["coingecko_rank"],
        coingeckoScore: (json["coingecko_score"] as num) == null
            ? null
            : (json["coingecko_score"] as num),

        publicInterestScore: json["public_interest_score"] == null
            ? null
            : json["public_interest_score"],
        marketData: MarketData.fromJson(json["market_data"]) == null
            ? null
            : MarketData.fromJson(json["market_data"]),
        statusUpdates:
            List<dynamic>.from(json["status_updates"].map((x) => x)) == null
                ? null
                : List<dynamic>.from(json["status_updates"].map((x) => x)),
        lastUpdated: DateTime.parse(json["last_updated"]) == null
            ? null
            : DateTime.parse(json["last_updated"]),
        tickers: List<Ticker>.from(
                    json["tickers"].map((x) => Ticker.fromJson(x))) ==
                null
            ? null
            : List<Ticker>.from(json["tickers"].map((x) => Ticker.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": idValues.reverse[id] == null ? null : idValues.reverse[id],
        "symbol": symbol == null ? null : symbol,
        "name": name == null ? null : name,
        "asset_platform_id": assetPlatformId == null ? null : assetPlatformId,
        "block_time_in_minutes":
            blockTimeInMinutes == null ? null : blockTimeInMinutes,
        "hashing_algorithm": hashingAlgorithm == null ? null : hashingAlgorithm,
        "categories": List<dynamic>.from(categories!.map((x) => x)) == null
            ? null
            : List<dynamic>.from(categories!.map((x) => x)),
        // "public_notice": publicNotice == null ? null : publicNotice,
        "additional_notices":
            List<dynamic>.from(additionalNotices!.map((x) => x)) == null
                ? null
                : List<dynamic>.from(additionalNotices!.map((x) => x)),
        "image": image!.toJson() == null ? null : image!.toJson(),
        "country_origin": countryOrigin == null ? null : countryOrigin,
        // "genesis_date":
        //     "${genesisDate!.year.toString().padLeft(4, '0')}-${genesisDate!.month.toString().padLeft(2, '0')}-${genesisDate!.day.toString().padLeft(2, '0')}" ==
        //             null
        //         ? null
        //         : "${genesisDate!.year.toString().padLeft(4, '0')}-${genesisDate!.month.toString().padLeft(2, '0')}-${genesisDate!.day.toString().padLeft(2, '0')}",
        "sentiment_votes_up_percentage": sentimentVotesUpPercentage == null
            ? null
            : sentimentVotesUpPercentage,
        "sentiment_votes_down_percentage": sentimentVotesDownPercentage == null
            ? null
            : sentimentVotesDownPercentage,
        "market_cap_rank": marketCapRank == null ? null : marketCapRank,
        "coingecko_rank": coingeckoRank == null ? null : coingeckoRank,
        "coingecko_score": coingeckoScore == null ? null : coingeckoScore,

        "public_interest_score":
            publicInterestScore == null ? null : publicInterestScore,
        "market_data":
            marketData!.toJson() == null ? null : marketData!.toJson(),
        "status_updates":
            List<dynamic>.from(statusUpdates!.map((x) => x)) == null
                ? null
                : List<dynamic>.from(statusUpdates!.map((x) => x)),
        "last_updated": lastUpdated!.toIso8601String() == null
            ? null
            : lastUpdated!.toIso8601String(),
        "tickers": List<dynamic>.from(tickers!.map((x) => x.toJson())) == null
            ? null
            : List<dynamic>.from(tickers!.map((x) => x.toJson())),
      };
}

enum Id { BITCOIN, TETHER, BINANCE_USD, USD_COIN, BRZ }

final idValues = EnumValues({
  "binance-usd": Id.BINANCE_USD,
  "bitcoin": Id.BITCOIN,
  "brz": Id.BRZ,
  "tether": Id.TETHER,
  "usd-coin": Id.USD_COIN
});

class Image {
  Image({
    this.thumb,
    this.small,
    this.large,
  });

  String? thumb;
  String? small;
  String? large;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        thumb: json["thumb"] == null ? null : json["thumb"],
        small: json["small"] == null ? null : json["small"],
        large: json["large"] == null ? null : json["large"],
      );

  Map<String, dynamic> toJson() => {
        "thumb": thumb == null ? null : thumb,
        "small": small == null ? null : small,
        "large": large == null ? null : large,
      };
}

class MarketData {
  MarketData({
    this.currentPrice,
    this.totalValueLocked,
    this.mcapToTvlRatio,
    this.fdvToTvlRatio,
    this.roi,
    this.ath,
    this.athChangePercentage,
    this.athDate,
    this.atl,
    this.atlChangePercentage,
    this.atlDate,
    this.marketCap,
    this.marketCapRank,
    this.fullyDilutedValuation,
    this.totalVolume,
    this.high24H,
    this.low24H,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.priceChangePercentage7D,
    this.priceChangePercentage14D,
    this.priceChangePercentage30D,
    this.priceChangePercentage60D,
    this.priceChangePercentage200D,
    this.priceChangePercentage1Y,
    this.marketCapChange24H,
    this.marketCapChangePercentage24H,
    this.priceChange24HInCurrency,
    this.priceChangePercentage1HInCurrency,
    this.priceChangePercentage24HInCurrency,
    this.priceChangePercentage7DInCurrency,
    this.priceChangePercentage14DInCurrency,
    this.priceChangePercentage30DInCurrency,
    this.priceChangePercentage60DInCurrency,
    this.priceChangePercentage200DInCurrency,
    this.priceChangePercentage1YInCurrency,
    this.marketCapChange24HInCurrency,
    this.marketCapChangePercentage24HInCurrency,
    this.totalSupply,
    this.maxSupply,
    this.circulatingSupply,
    this.lastUpdated,
  });

  Map<String, num>? currentPrice;
  dynamic totalValueLocked;
  dynamic mcapToTvlRatio;
  dynamic fdvToTvlRatio;
  dynamic roi;
  Map<String, num>? ath;
  Map<String, num>? athChangePercentage;
  Map<String, DateTime>? athDate;
  Map<String, num>? atl;
  Map<String, num>? atlChangePercentage;
  Map<String, DateTime>? atlDate;
  Map<String, num>? marketCap;
  int? marketCapRank;
  Map<String, num>? fullyDilutedValuation;
  Map<String, num>? totalVolume;
  Map<String, num>? high24H;
  Map<String, num>? low24H;
  num? priceChange24H;
  num? priceChangePercentage24H;
  num? priceChangePercentage7D;
  num? priceChangePercentage14D;
  num? priceChangePercentage30D;
  num? priceChangePercentage60D;
  num? priceChangePercentage200D;
  num? priceChangePercentage1Y;
  num? marketCapChange24H;
  num? marketCapChangePercentage24H;
  Map<String, num>? priceChange24HInCurrency;
  Map<String, num>? priceChangePercentage1HInCurrency;
  Map<String, num>? priceChangePercentage24HInCurrency;
  Map<String, num>? priceChangePercentage7DInCurrency;
  Map<String, num>? priceChangePercentage14DInCurrency;
  Map<String, num>? priceChangePercentage30DInCurrency;
  Map<String, num>? priceChangePercentage60DInCurrency;
  Map<String, num>? priceChangePercentage200DInCurrency;
  Map<String, num>? priceChangePercentage1YInCurrency;
  Map<String, num>? marketCapChange24HInCurrency;
  Map<String, num>? marketCapChangePercentage24HInCurrency;
  num? totalSupply;
  num? maxSupply;
  num? circulatingSupply;
  DateTime? lastUpdated;

  factory MarketData.fromJson(Map<String, dynamic> json) => MarketData(
        currentPrice: Map.from(json["current_price"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["current_price"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        totalValueLocked: json["total_value_locked"] == null
            ? null
            : json["total_value_locked"],
        mcapToTvlRatio: json["mcap_to_tvl_ratio"] == null
            ? null
            : json["mcap_to_tvl_ratio"],
        fdvToTvlRatio:
            json["fdv_to_tvl_ratio"] == null ? null : json["fdv_to_tvl_ratio"],
        roi: json["roi"] == null ? null : json["roi"],
        ath: Map.from(json["ath"]).map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["ath"]).map((k, v) => MapEntry<String, num>(k, v)),
        athChangePercentage: Map.from(json["ath_change_percentage"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["ath_change_percentage"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        athDate: Map.from(json["ath_date"]).map((k, v) =>
                    MapEntry<String, DateTime>(k, DateTime.parse(v))) ==
                null
            ? null
            : Map.from(json["ath_date"]).map(
                (k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        atl: Map.from(json["atl"]).map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["atl"]).map((k, v) => MapEntry<String, num>(k, v)),
        atlChangePercentage: Map.from(json["atl_change_percentage"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["atl_change_percentage"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        atlDate: Map.from(json["atl_date"]).map((k, v) =>
                    MapEntry<String, DateTime>(k, DateTime.parse(v))) ==
                null
            ? null
            : Map.from(json["atl_date"]).map(
                (k, v) => MapEntry<String, DateTime>(k, DateTime.parse(v))),
        marketCap: Map.from(json["market_cap"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["market_cap"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        marketCapRank:
            json["market_cap_rank"] == null ? null : json["market_cap_rank"],
        fullyDilutedValuation: Map.from(json["fully_diluted_valuation"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["fully_diluted_valuation"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        totalVolume: Map.from(json["total_volume"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["total_volume"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        high24H: Map.from(json["high_24h"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["high_24h"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        low24H: Map.from(json["low_24h"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["low_24h"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        priceChange24H:
            json["price_change_24h"] == null ? null : json["price_change_24h"],
        priceChangePercentage24H: json["price_change_percentage_24h"] == null
            ? null
            : json["price_change_percentage_24h"],
        priceChangePercentage7D: json["price_change_percentage_7d"] == null
            ? null
            : json["price_change_percentage_7d"],
        priceChangePercentage14D: json["price_change_percentage_14d"] == null
            ? null
            : json["price_change_percentage_14d"],
        priceChangePercentage30D: json["price_change_percentage_30d"] == null
            ? null
            : json["price_change_percentage_30d"],
        priceChangePercentage60D: json["price_change_percentage_60d"] == null
            ? null
            : json["price_change_percentage_60d"],
        priceChangePercentage200D: json["price_change_percentage_200d"] == null
            ? null
            : json["price_change_percentage_200d"],
        priceChangePercentage1Y: json["price_change_percentage_1y"] == null
            ? null
            : json["price_change_percentage_1y"],
        marketCapChange24H: json["market_cap_change_24h"] == null
            ? null
            : json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"] == null
                ? null
                : json["market_cap_change_percentage_24h"],
        priceChange24HInCurrency: Map.from(json["price_change_24h_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["price_change_24h_in_currency"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage1HInCurrency:
            Map.from(json["price_change_percentage_1h_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["price_change_percentage_1h_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage24HInCurrency:
            Map.from(json["price_change_percentage_24h_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["price_change_percentage_24h_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage7DInCurrency:
            Map.from(json["price_change_percentage_7d_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["price_change_percentage_7d_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage14DInCurrency:
            Map.from(json["price_change_percentage_14d_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["price_change_percentage_14d_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage30DInCurrency:
            Map.from(json["price_change_percentage_30d_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["price_change_percentage_30d_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage60DInCurrency:
            Map.from(json["price_change_percentage_60d_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["price_change_percentage_60d_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage200DInCurrency:
            Map.from(json["price_change_percentage_200d_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["price_change_percentage_200d_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        priceChangePercentage1YInCurrency:
            Map.from(json["price_change_percentage_1y_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["price_change_percentage_1y_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        marketCapChange24HInCurrency:
            Map.from(json["market_cap_change_24h_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["market_cap_change_24h_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        marketCapChangePercentage24HInCurrency:
            Map.from(json["market_cap_change_percentage_24h_in_currency"])
                        .map((k, v) => MapEntry<String, num>(k, v)) ==
                    null
                ? null
                : Map.from(json["market_cap_change_percentage_24h_in_currency"])
                    .map((k, v) => MapEntry<String, num>(k, v)),
        totalSupply: json["total_supply"] == null ? null : json["total_supply"],
        maxSupply: json["max_supply"] == null ? null : json["max_supply"],
        circulatingSupply: json["circulating_supply"] == null
            ? null
            : json["circulating_supply"],
        lastUpdated: DateTime.parse(json["last_updated"]) == null
            ? null
            : DateTime.parse(json["last_updated"]),
      );

  Map<String, dynamic> toJson() => {
        "current_price": Map.from(currentPrice!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(currentPrice!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_value_locked":
            totalValueLocked == null ? null : totalValueLocked,
        "mcap_to_tvl_ratio": mcapToTvlRatio == null ? null : mcapToTvlRatio,
        "fdv_to_tvl_ratio": fdvToTvlRatio == null ? null : fdvToTvlRatio,
        "roi": roi == null ? null : roi,
        "ath": Map.from(ath!).map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(ath!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_change_percentage": Map.from(athChangePercentage!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(athChangePercentage!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "ath_date": Map.from(athDate!).map((k, v) =>
                    MapEntry<String, dynamic>(k, v.toIso8601String())) ==
                null
            ? null
            : Map.from(athDate!).map(
                (k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "atl": Map.from(atl!).map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(atl!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_change_percentage": Map.from(atlChangePercentage!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(atlChangePercentage!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "atl_date": Map.from(atlDate!).map((k, v) =>
                    MapEntry<String, dynamic>(k, v.toIso8601String())) ==
                null
            ? null
            : Map.from(atlDate!).map(
                (k, v) => MapEntry<String, dynamic>(k, v.toIso8601String())),
        "market_cap": Map.from(marketCap!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(marketCap!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_rank": marketCapRank == null ? null : marketCapRank,
        "fully_diluted_valuation": Map.from(fullyDilutedValuation!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(fullyDilutedValuation!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_volume": Map.from(totalVolume!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(totalVolume!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "high_24h": Map.from(high24H!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(high24H!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "low_24h": Map.from(low24H!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(low24H!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_24h": priceChange24H == null ? null : priceChange24H,
        "price_change_percentage_24h":
            priceChangePercentage24H == null ? null : priceChangePercentage24H,
        "price_change_percentage_7d":
            priceChangePercentage7D == null ? null : priceChangePercentage7D,
        "price_change_percentage_14d":
            priceChangePercentage14D == null ? null : priceChangePercentage14D,
        "price_change_percentage_30d":
            priceChangePercentage30D == null ? null : priceChangePercentage30D,
        "price_change_percentage_60d":
            priceChangePercentage60D == null ? null : priceChangePercentage60D,
        "price_change_percentage_200d": priceChangePercentage200D == null
            ? null
            : priceChangePercentage200D,
        "price_change_percentage_1y":
            priceChangePercentage1Y == null ? null : priceChangePercentage1Y,
        "market_cap_change_24h":
            marketCapChange24H == null ? null : marketCapChange24H,
        "market_cap_change_percentage_24h": marketCapChangePercentage24H == null
            ? null
            : marketCapChangePercentage24H,
        "price_change_24h_in_currency": Map.from(priceChange24HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(priceChange24HInCurrency!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1h_in_currency":
            Map.from(priceChangePercentage1HInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage1HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_24h_in_currency":
            Map.from(priceChangePercentage24HInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage24HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_7d_in_currency":
            Map.from(priceChangePercentage7DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage7DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_14d_in_currency":
            Map.from(priceChangePercentage14DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage14DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_30d_in_currency":
            Map.from(priceChangePercentage30DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage30DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_60d_in_currency":
            Map.from(priceChangePercentage60DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage60DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_200d_in_currency":
            Map.from(priceChangePercentage200DInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage200DInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "price_change_percentage_1y_in_currency":
            Map.from(priceChangePercentage1YInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(priceChangePercentage1YInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_24h_in_currency":
            Map.from(marketCapChange24HInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(marketCapChange24HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "market_cap_change_percentage_24h_in_currency":
            Map.from(marketCapChangePercentage24HInCurrency!)
                        .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                    null
                ? null
                : Map.from(marketCapChangePercentage24HInCurrency!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_supply": totalSupply == null ? null : totalSupply,
        "max_supply": maxSupply == null ? null : maxSupply,
        "circulating_supply":
            circulatingSupply == null ? null : circulatingSupply,
        "last_updated": lastUpdated!.toIso8601String() == null
            ? null
            : lastUpdated!.toIso8601String(),
      };
}

class Ticker {
  Ticker({
    this.base,
    this.target,
    this.market,
    this.last,
    this.volume,
    this.convertedLast,
    this.convertedVolume,
    this.trustScore,
    this.bidAskSpreadPercentage,
    this.timestamp,
    this.lastTradedAt,
    this.lastFetchAt,
    this.isAnomaly,
    this.isStale,
    // this.tradeUrl,
    // this.tokenInfoUrl,
    this.coinId,
    // this.targetCoinId,
  });

  String? base;
  String? target;
  Market? market;
  num? last;
  num? volume;
  Map<String, num>? convertedLast;
  Map<String, num>? convertedVolume;
  TrustScore? trustScore;
  num? bidAskSpreadPercentage;
  DateTime? timestamp;
  DateTime? lastTradedAt;
  DateTime? lastFetchAt;
  bool? isAnomaly;
  bool? isStale;
  // String? tradeUrl;
  // dynamic tokenInfoUrl;
  String? coinId;
  // Id? targetCoinId;

  factory Ticker.fromJson(Map<String, dynamic> json) => Ticker(
        base: json["base"] == null ? null : json["base"],
        target: json["target"] == null ? null : json["target"],
        market: Market.fromJson(json["market"]) == null
            ? null
            : Market.fromJson(json["market"]),
        last: json["last"] == null ? null : json["last"],
        volume: json["volume"] == null ? null : json["volume"].toDouble(),
        convertedLast: Map.from(json["converted_last"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["converted_last"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        convertedVolume: Map.from(json["converted_volume"])
                    .map((k, v) => MapEntry<String, num>(k, v)) ==
                null
            ? null
            : Map.from(json["converted_volume"])
                .map((k, v) => MapEntry<String, num>(k, v)),
        trustScore: trustScoreValues.map[json["trust_score"]] == null
            ? null
            : trustScoreValues.map[json["trust_score"]],
        bidAskSpreadPercentage: json["bid_ask_spread_percentage"] == null
            ? null
            : json["bid_ask_spread_percentage"],
        timestamp: DateTime.parse(json["timestamp"]) == null
            ? null
            : DateTime.parse(json["timestamp"]),
        lastTradedAt: DateTime.parse(json["last_traded_at"]) == null
            ? null
            : DateTime.parse(json["last_traded_at"]),
        lastFetchAt: DateTime.parse(json["last_fetch_at"]) == null
            ? null
            : DateTime.parse(json["last_fetch_at"]),
        isAnomaly: json["is_anomaly"] == null ? null : json["is_anomaly"],
        isStale: json["is_stale"] == null ? null : json["is_stale"],
        // tradeUrl: json["trade_url"] == null ? null : json["trade_url"],
        // tokenInfoUrl:
        //     json["token_info_url"] == null ? null : json["token_info_url"],
        coinId: json["coin_id"] == null ? null : json["coin_id"],
        // targetCoinId: json["target_coin_id"] == null
        //     ? null
        //     : idValues.map[json["target_coin_id"]],
      );

  Map<String, dynamic> toJson() => {
        "base": base == null ? null : base,
        "target": target == null ? null : target,
        "market": market!.toJson() == null ? null : market!.toJson(),
        "last": last == null ? null : last,
        "volume": volume == null ? null : volume,
        "converted_last": Map.from(convertedLast!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(convertedLast!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "converted_volume": Map.from(convertedVolume!)
                    .map((k, v) => MapEntry<String, dynamic>(k, v)) ==
                null
            ? null
            : Map.from(convertedVolume!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "trust_score": trustScoreValues.reverse[trustScore] == null
            ? null
            : trustScoreValues.reverse[trustScore],
        "bid_ask_spread_percentage":
            bidAskSpreadPercentage == null ? null : bidAskSpreadPercentage,
        "timestamp": timestamp!.toIso8601String() == null
            ? null
            : timestamp!.toIso8601String(),
        "last_traded_at": lastTradedAt!.toIso8601String() == null
            ? null
            : lastTradedAt!.toIso8601String(),
        "last_fetch_at": lastFetchAt!.toIso8601String() == null
            ? null
            : lastFetchAt!.toIso8601String(),
        "is_anomaly": isAnomaly == null ? null : isAnomaly,
        "is_stale": isStale == null ? null : isStale,
        // "trade_url": tradeUrl == null ? null : tradeUrl,
        // "token_info_url": tokenInfoUrl == null ? null : tokenInfoUrl,
        "coin_id": coinId == null ? null : coinId,
        // "target_coin_id":
        //     targetCoinId == null ? null : idValues.reverse[targetCoinId],
      };
}

class Market {
  Market({
    this.name,
    this.identifier,
    this.hasTradingIncentive,
  });

  String? name;
  String? identifier;
  bool? hasTradingIncentive;

  factory Market.fromJson(Map<String, dynamic> json) => Market(
        name: json["name"] == null ? null : json["name"],
        identifier: json["identifier"] == null ? null : json["identifier"],
        hasTradingIncentive: json["has_trading_incentive"] == null
            ? null
            : json["has_trading_incentive"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "identifier": identifier == null ? null : identifier,
        "has_trading_incentive":
            hasTradingIncentive == null ? null : hasTradingIncentive,
      };
}

enum TrustScore { GREEN }

final trustScoreValues = EnumValues({"green": TrustScore.GREEN});

class EnumValues<T> {
  late Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
