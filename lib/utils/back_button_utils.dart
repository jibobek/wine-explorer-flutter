import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BackButtonUtils {
  static DateTime? currentBackPressTime;

  static Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      const snackBar =
          SnackBar(content: Text('Použijte zpět znovu pro ukončení aplikace.'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      SystemNavigator.pop();
    }
    return Future.value(false);
  }
}
