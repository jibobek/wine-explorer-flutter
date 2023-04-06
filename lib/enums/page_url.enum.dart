enum PageUrl { home, explore, wineDetail, reviews, favorites, cameraPreview }

extension PageUrlKey on PageUrl {
  String get asString {
    switch (this) {
      case PageUrl.home:
        return "/home";
      case PageUrl.explore:
        return "/explore";
      case PageUrl.wineDetail:
        return "/wine-detail";
      case PageUrl.reviews:
        return "/reviews";
      case PageUrl.favorites:
        return "/favorites";
      case PageUrl.cameraPreview:
        return "/camera-preview";

      default:
        return "/";
    }
  }
}
