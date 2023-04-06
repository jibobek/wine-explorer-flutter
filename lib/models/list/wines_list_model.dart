import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:wine_explorer/models/list/wines_market_model.dart';
part 'wines_list_model.g.dart';

@JsonSerializable()
class WinesListModel {
  @JsonKey(name: "e")
  String e;
  @JsonKey(name: "explore_vintage")
  WinesMarketModel winesMarketModel;

  WinesListModel({required this.e, required this.winesMarketModel});

  factory WinesListModel.fromJson(Map<String, dynamic> json) =>
      _$WinesListModelFromJson(json);
  Map<String, dynamic> toJson() => _$WinesListModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
