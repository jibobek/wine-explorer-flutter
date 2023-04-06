import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wine_explorer/controllers/wines_controller.dart';
import 'package:wine_explorer/enums/page_url.enum.dart';
import 'package:wine_explorer/models/filter/wines_filter_model.dart';
import 'package:wine_explorer/models/list/wines_list_model.dart';
import 'package:wine_explorer/models/list/wines_market_model.dart';
import 'package:wine_explorer/pages/explore/components/explore_item_widget.dart';
import 'package:wine_explorer/pages/explore/components/filter_widget.dart';
import 'package:wine_explorer/services/route_service.dart';

class ExplorePage extends StatefulWidget {
  WinesFilter winesFilter = WinesFilter.init();
  ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  WinesMarketModel? _winesMarketModel;

  @override
  void initState() {
    super.initState();
    _loadWines();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Vyhledávání vín"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FilterWidget(
              winesFilter: widget.winesFilter,
              onFilterApply: () {
                debugPrint("Apply changes");
                _loadWines();
              },
            ),
            Visibility(
              visible: _winesMarketModel != null,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _winesMarketModel?.records.length,
                itemBuilder: ((context, index) {
                  return ExploreItemWidget(
                    imageUrl: _winesMarketModel!.records[index].vintageModel
                                .wineImageModel.variationsModel.bottleLarge !=
                            null
                        ? _winesMarketModel!.records[index].vintageModel
                                .wineImageModel.variationsModel.bottleLarge ??
                            ""
                        : _winesMarketModel!.records[index].vintageModel
                            .wineImageModel.location,
                    year: _winesMarketModel!.records[index].vintageModel.year,
                    title: _winesMarketModel!
                        .records[index].vintageModel.wineModel.name,
                    description: _winesMarketModel!.records[index].vintageModel
                            .wineModel.wineStyleModel?.name ??
                        "",
                    rating: _winesMarketModel!.records[index].vintageModel
                        .wineModel.wineStatisticsModel.ratingsAverage,
                    price:
                        _winesMarketModel!.records[index].winePriceModel.amount,
                    pricePrefix: _winesMarketModel
                        ?.records[index].winePriceModel.currencyModel.prefix,
                    priceSuffix: _winesMarketModel
                        ?.records[index].winePriceModel.currencyModel.suffix,
                    onTap: () => _openWine(index),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _loadWines() async {
    WinesController winesController = WinesController();
    EasyLoading.show(status: "Načítám seznam...", dismissOnTap: false);
    WinesListModel? winesListModel =
        await winesController.getWines(widget.winesFilter);
    EasyLoading.dismiss();
    if (winesListModel == null) {
      debugPrint("Unexpected, winesListModel is null");
      return;
    }
    setState(() {
      _winesMarketModel = winesListModel.winesMarketModel;
    });
/*     debugPrint(
        winesListModel.winesMarketModel.records.first.vintageModel.toString()); */
    debugPrint(
        "Wines count: ${winesListModel.winesMarketModel.records.length}");
    /* debugPrint("Count of wines:" +
        winesListModel?.winesMarketModel.records.length.toString()); */

     /*   RouteService.pushRouteWithArgs(PageUrl.wineDetail,
        winesListModel.winesMarketModel.records[1], context); */
  /*   debugPrint("Wine id: " +
        winesListModel.winesMarketModel.records[1].vintageModel.wineModel.id
            .toString()); */
  }

  void _openWine(int index) {
    if (_winesMarketModel == null) {
      return;
    }
    RouteService.pushRouteWithArgs(
        PageUrl.wineDetail, _winesMarketModel!.records[index], context);
  }
}
