import 'package:flutter/material.dart';
import 'package:wine_explorer/models/review/review_model.dart';
import 'package:wine_explorer/models/wine/wine_record_model.dart';
import 'package:wine_explorer/pages/camera_preview/camera_preview_page.dart';
import 'package:wine_explorer/pages/explore/explore_page.dart';
import 'package:wine_explorer/pages/favorites/favorites_page.dart';
import 'package:wine_explorer/pages/home/home_page.dart';
import 'package:wine_explorer/pages/reviews/reviews_page.dart';
import 'package:wine_explorer/pages/wine_detail/wine_detail_page.dart';

import '../enums/page_url.enum.dart';

class RouteService {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    String? url = settings.name;
    debugPrint("Url: $url");

    if (url == PageUrl.home.asString) {
      return MaterialPageRoute(builder: (_) => const HomePage());
    }

    if (url == PageUrl.explore.asString) {
      return MaterialPageRoute(builder: (_) => ExplorePage());
    }

    if (url == PageUrl.wineDetail.asString && args is WineRecordModel) {
      return MaterialPageRoute(
          builder: (_) => WineDetailPage(wineRecordModel: args));
    }

    if (url == PageUrl.reviews.asString && args is int) {
      return MaterialPageRoute(builder: (_) => ReviewsPage(wineId: args));
    }

    if (url == PageUrl.favorites.asString) {
      return MaterialPageRoute(builder: (_) => FavoritesPage());
    }

    if (url == PageUrl.cameraPreview.asString && args is int) {
      return MaterialPageRoute(builder: (_) => CameraPreviewPage(wineId: args));
    }

    return _errorRoute();
  }

  static void pushRoute(PageUrl pageUrl, BuildContext context) {
    Navigator.pushNamed(context, pageUrl.asString);
  }

  static Future<void> pushRouteWithArgs(
      PageUrl pageUrl, Object? args, BuildContext context) {
    return Navigator.pushNamed(context, pageUrl.asString, arguments: args);
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('404'),
        ),
      );
    });
  }

  static void popRoute(BuildContext context) {
    Navigator.pop(context);
  }

  static void popAllRoutes(BuildContext context) {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
