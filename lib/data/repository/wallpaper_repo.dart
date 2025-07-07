import 'package:wallpaper_ui/data/API%20helper/api_helper.dart';

class WallPaperRepository{
  ApiHelper apiHelper;
  WallPaperRepository({required this.apiHelper});

  /// Trending Wallpaper

  Future<dynamic> getCuratedWallPaper() async{
    try{
      return await apiHelper.getAPI(url: ApiHelper.PEXELS_CURATED_URL);
    } catch(e){
      throw(e);
    }
  }

  /// Search Wallpaper

  Future<dynamic> getSearchWallPaper(String mQuery , {String mColor = "", int mPage = 1}) async{
    try{
      return await apiHelper.getAPI(url: "${ApiHelper.PEXELS_SEARCH_URL}?query=$mQuery&color=$mColor&page=$mPage");
    } catch(e){
      throw(e);
    }
  }


}