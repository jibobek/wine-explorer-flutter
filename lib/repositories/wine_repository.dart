import 'package:flutter/material.dart';
import 'package:wine_explorer/models/filter/wines_filter_model.dart';
import 'package:wine_explorer/services/http_service.dart';
import 'package:dio/dio.dart';

class WineRepository {
  final HttpService _httpService;

  WineRepository(dio) : _httpService = HttpService(dio);

  Future<Response> getWines(WinesFilter winesFilter) async {
    Map<String, dynamic> params = {
      //"country_code": "CZ",
      "currency_code": "CZK",
      //"grape_filter": "varietal",
      //"min_rating": 1,
      "page": 1,
      "per_page": 50
      //"price_range_max": 300,
      //"price_range_min": 0
    };
    //debugPrint(winesFilter.toString());
    params.addAll(winesFilter.toApiRequest());
    debugPrint("Params: " + params.toString());
    return _httpService.getRequest("/explore/explore", params);
  }
}
