import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wine_explorer/constants/storage_key_constants.dart';
import 'package:wine_explorer/models/wine/wine_record_model.dart';

class FavoriteService {
  static SharedPreferences? prefs;
  static List<WineRecordModel> favorites = [];

  static Future<void> loadFromStorage() async {
    debugPrint("load favorites from storage");
    List<String>? items = prefs?.getStringList(kFavoritesKey);
    favorites = [];
    if (items == null) {
      return;
    }
    for (var e in items) {
      favorites.add(WineRecordModel.fromJson(jsonDecode(e)));
    }

    debugPrint(favorites.toString());
  }

  static Future<void> saveToStorage() async {
    List<String> jsons = [];
    for (var e in favorites) {
      jsons.add(e.toString());
    }

    await prefs?.setStringList(kFavoritesKey, jsons);
    debugPrint(jsons.toString());
  }

  static void add(WineRecordModel wineRecordModel) {
    if (!isInFavorites(wineRecordModel)) {
      favorites.add(wineRecordModel);
      FavoriteService.saveToStorage();
    }
  }

  static void remove(WineRecordModel wineRecordModel) {
    for (WineRecordModel e in favorites) {
      if (jsonEncode(e) == jsonEncode(e)) {
        favorites.remove(e);
        FavoriteService.saveToStorage();
      }
    }
  }

  static isInFavorites(WineRecordModel wineRecordModel) {
    bool alreadyExists = false;
    debugPrint(favorites.toString());
    for (WineRecordModel e in favorites) {
      if (e.vintageModel.id == wineRecordModel.vintageModel.id) {
        alreadyExists = true;
      }
    }
    debugPrint("is in favorites: ${wineRecordModel.vintageModel.name} $alreadyExists");
    return alreadyExists;
  }

  static void initStorage() async {
    debugPrint("init storage");
    prefs = await SharedPreferences.getInstance();
    loadFromStorage();
  }
}
