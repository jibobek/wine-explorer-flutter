import 'package:flutter/material.dart';
import 'package:wine_explorer/enums/page_url.enum.dart';
import 'package:wine_explorer/pages/explore/components/explore_item_widget.dart';
import 'package:wine_explorer/services/favorite_service.dart';
import 'package:wine_explorer/services/route_service.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Oblíbené"),
      ),
      body: Column(
        children: [
          Visibility(
            visible: FavoriteService.favorites.isEmpty,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.warning,
                    size: 100.0,
                    color: Colors.grey,
                  ),
                  Text(
                    "Nemáte žádné položky v oblíbených.",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SingleChildScrollView(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: FavoriteService.favorites.length,
              itemBuilder: ((context, index) {
                return ExploreItemWidget(
                  imageUrl: FavoriteService.favorites[index].vintageModel
                              .wineImageModel.variationsModel.bottleLarge !=
                          null
                      ? FavoriteService.favorites[index].vintageModel
                              .wineImageModel.variationsModel.bottleLarge ??
                          ""
                      : FavoriteService.favorites[index].vintageModel
                          .wineImageModel.location,
                  year: FavoriteService.favorites[index].vintageModel.year,
                  title: FavoriteService
                      .favorites[index].vintageModel.wineModel.name,
                  description: FavoriteService.favorites[index].vintageModel
                          .wineModel.wineStyleModel?.name ??
                      "",
                  rating: FavoriteService.favorites[index].vintageModel
                      .wineModel.wineStatisticsModel.ratingsAverage,
                  price: FavoriteService.favorites[index].winePriceModel.amount,
                  pricePrefix: FavoriteService
                      .favorites[index].winePriceModel.currencyModel.prefix,
                  priceSuffix: FavoriteService
                      .favorites[index].winePriceModel.currencyModel.suffix,
                  onTap: () => _openWine(index),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  void _openWine(int index) {
    RouteService.pushRouteWithArgs(
            PageUrl.wineDetail, FavoriteService.favorites[index], context)
        .then((_) => setState(() {}));
  }
}
