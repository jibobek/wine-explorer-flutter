import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:wine_explorer/models/review/reviews_model.dart';
import 'package:wine_explorer/repositories/review_repositoty.dart';

class ReviewsController {
  late ReviewRepository _reviewRepository;

  ReviewsController() {
    _reviewRepository = ReviewRepository(Dio());
  }

  Future<ReviewsModel?> getReviews(int wineId) async {
    Response response = await _reviewRepository.getReviewsForWine(wineId);
    try {
      return ReviewsModel.fromJson(response.data);
    } catch (e, stacktrace) {
      debugPrint(e.toString());
      print('Stacktrace: ' + stacktrace.toString());
    }
    return null;
  }
}
