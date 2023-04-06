import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wine_explorer/enums/page_url.enum.dart';
import 'package:wine_explorer/models/wine/wine_record_model.dart';
import 'package:wine_explorer/services/favorite_service.dart';
import 'package:wine_explorer/services/route_service.dart';
import 'package:wine_explorer/utils/file_utils.dart';

class WineDetailPage extends StatefulWidget {
  final WineRecordModel wineRecordModel;
  const WineDetailPage({super.key, required this.wineRecordModel});

  @override
  State<WineDetailPage> createState() => _WineDetailPageState();
}

class _WineDetailPageState extends State<WineDetailPage> {
  final List<String> smallImageUrls = [];
  List<File> localImagePaths = [];

  @override
  void initState() {
    _fillImages();
    _loadLocalImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.wineRecordModel.vintageModel.name),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              heroTag: "fab1",
              onPressed: () {
                RouteService.pushRouteWithArgs(PageUrl.cameraPreview,
                        widget.wineRecordModel.vintageModel.id, context)
                    .then((_) => setState(() {}));
              },
              child: const Icon(Icons.camera),
            ),
            FloatingActionButton(
              heroTag: "fab2",
              onPressed: () => _toggleFavorite(),
              child: Icon(FavoriteService.isInFavorites(widget.wineRecordModel)
                  ? Icons.favorite
                  : Icons.favorite_border),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    _getMainImage(),
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.wineRecordModel.vintageModel.name,
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                GestureDetector(
                  onTap: () => _openReviews(),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        widget.wineRecordModel.vintageModel.wineModel
                            .wineStatisticsModel.ratingsAverage
                            .toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '(${widget.wineRecordModel.vintageModel.wineModel.wineStatisticsModel.ratingsCount} hodnocení)',
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  widget.wineRecordModel.vintageModel.wineModel.wineStyleModel
                          ?.name ??
                      "",
                  style: const TextStyle(
                    fontSize: 16.0,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  '${widget.wineRecordModel.winePriceModel.currencyModel.suffix ?? ""} ${widget.wineRecordModel.winePriceModel.amount.toStringAsFixed(2)} ${widget.wineRecordModel.winePriceModel.currencyModel.prefix ?? ""}',
                  style: const TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Obrázky:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: smallImageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.network(
                        'https:$url',
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.contain,
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16.0),
                Visibility(
                  visible: localImagePaths.isNotEmpty,
                  child: const Text(
                    'Fotografie:',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Visibility(
                  visible: localImagePaths.isNotEmpty,
                  child: Row(
                    children: localImagePaths.map((path) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Image.file(
                          path,
                          height: 50.0,
                          width: 50.0,
                          fit: BoxFit.contain,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 128, width: 128)
        ],
      ),
    );
  }

  void _fillImages() {
    widget.wineRecordModel.vintageModel.wineImageModel.variationsModel
        .toMap()
        .forEach((key, value) {
      if (value != null) {
        smallImageUrls.add(value);
      }
    });
  }

  String _getMainImage() {
    if (widget.wineRecordModel.vintageModel.wineImageModel.variationsModel
            .bottleLarge !=
        null) {
      return 'https:${widget.wineRecordModel.vintageModel.wineImageModel.variationsModel.bottleLarge}';
    }
    return 'https:${smallImageUrls.first}';
  }

  _openReviews() {
    RouteService.pushRouteWithArgs(PageUrl.reviews,
        widget.wineRecordModel.vintageModel.wineModel.id, context);
  }

  _toggleFavorite() {
    debugPrint("toggle favorite");
    setState(() {
      widget.wineRecordModel.isFavorite = !widget.wineRecordModel.isFavorite;
    });
    if (widget.wineRecordModel.isFavorite) {
      FavoriteService.add(widget.wineRecordModel);
    } else {
      FavoriteService.remove(widget.wineRecordModel);
    }
  }

  _loadLocalImages() async {
    final images =
        await FileUtils.getImageUrls(widget.wineRecordModel.vintageModel.id);
    setState(() {
      localImagePaths = images;
    });
    debugPrint("localImagePaths: " + localImagePaths.toString());
  }
}
