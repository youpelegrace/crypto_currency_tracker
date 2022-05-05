import 'package:flutter_application_3/core/services/model/chart_model.dart';

abstract class ICoinRepository {
  Future getCoin([String ids = '']);

  Future<ChartData> getCionData(String ids);
}
