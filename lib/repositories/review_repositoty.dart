import 'package:dio/dio.dart';
import 'package:wine_explorer/services/http_service.dart';

class ReviewRepository {
  final HttpService _httpService;

  ReviewRepository(dio) : _httpService = HttpService(dio);

  Future<Response> getReviewsForWine(int wineId) async {
    return _httpService.getRequest('/wines/${wineId}/reviews', {
      "per_page": 100
    });
  }
}
