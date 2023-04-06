import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FileUtils {
  static Future<String> wineImagePath(int wineId) async {
    final Directory extDir = await getTemporaryDirectory();
    final directory = await Directory('${extDir.path}/images/$wineId')
        .create(recursive: true);
    const String fileExtension = 'jpg';
    final String filePath =
        '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.$fileExtension';
    debugPrint("New image: $filePath");
    return filePath;
  }

  static Future<List<File>> getImageUrls(int wineId) async {
    final Directory extDir = await getTemporaryDirectory();
    try {
      final List<FileSystemEntity> entities =
          Directory('${extDir.path}/images/$wineId').listSync();
      debugPrint("Images: $entities");

      final Iterable<File> files = entities.whereType<File>();
      return files.toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
