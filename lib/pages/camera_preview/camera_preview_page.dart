import 'package:flutter/material.dart';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:wine_explorer/utils/file_utils.dart';

class CameraPreviewPage extends StatefulWidget {
  final int wineId;

  const CameraPreviewPage({super.key, required this.wineId});

  @override
  _CameraPreviewPageState createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.photo(
            pathBuilder: () => FileUtils.wineImagePath(widget.wineId),
          ),
          enablePhysicalButton: true,
          flashMode: FlashMode.auto,
          aspectRatio: CameraAspectRatios.ratio_16_9,
          previewFit: CameraPreviewFit.fitWidth,
        ),
      ),
    );
  }
}
