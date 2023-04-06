import 'package:flutter/cupertino.dart';
import 'package:wine_explorer/models/filter/wines_filter_model.dart';
import 'package:wine_explorer/models/list/wines_list_model.dart';
import 'package:wine_explorer/models/wine/wine_record_model.dart';
import 'package:wine_explorer/repositories/wine_repository.dart';
import 'package:dio/dio.dart';
import 'package:wine_explorer/services/favorite_service.dart';

class WinesController {
  late WineRepository _vineRepository;

  WinesController() {
    _vineRepository = WineRepository(Dio());
  }

  Future<WinesListModel?> getWines(WinesFilter winesFilter) async {
    Response response = await _vineRepository.getWines(winesFilter);
    try {
      return WinesListModel.fromJson(response.data);
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      print('Stacktrace: ' + stacktrace.toString());
    }
    return null;
  }
}
