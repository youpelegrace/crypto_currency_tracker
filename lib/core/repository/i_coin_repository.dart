import 'dart:io';


abstract class ICoinRepository {
  Future getCoin([String symbol = "btc"]);
}
