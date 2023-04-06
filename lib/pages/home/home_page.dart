import 'package:flutter/material.dart';
import 'package:wine_explorer/enums/page_url.enum.dart';
import 'package:wine_explorer/pages/home/components/home_tile_component.dart';
import 'package:wine_explorer/services/favorite_service.dart';
import 'package:wine_explorer/services/route_service.dart';
import 'package:wine_explorer/utils/back_button_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
    FavoriteService.initStorage();
    temp();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => BackButtonUtils.onWillPop(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Wine explorer"),
          automaticallyImplyLeading: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            crossAxisCount: 2,
            children: [
              HomeTileComponent(
                label: "Vyhledávání",
                icon: Icons.explore,
                onTap: () => {RouteService.pushRoute(PageUrl.explore, context)},
              ),
              HomeTileComponent(
                label: "Oblíbené",
                icon: Icons.favorite,
                onTap: () =>
                    {RouteService.pushRoute(PageUrl.favorites, context)},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void temp() async {
    Future.delayed(const Duration(milliseconds: 500), (() {
      //RouteService.pushRoute(PageUrl.cameraPreview, context);
    }));
  }
}
