import 'dart:convert';

class WinesFilter {
  late String countryCode;
  late int minRating;
  late double minPrice;
  late double maxPrice;
  late String orderBy;
  late String order;

  WinesFilter.init() {
    countryCode = "CZ";
    minPrice = 0;
    maxPrice = 9999999;
    minRating = 1;
    orderBy = "price";
    order = "asc";
  }

  WinesFilter(this.countryCode, this.minRating, this.minPrice, this.maxPrice,
      this.orderBy, this.order);

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toApiRequest() {
    return {
      "country_code": countryCode,
      "min_rating": minRating,
      "price_range_min": minPrice,
      "price_range_max": maxPrice,
      "order_by": orderBy,
      "order": order
    };
  }
}
