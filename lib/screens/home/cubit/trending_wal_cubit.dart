import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_ui/data/repository/wallpaper_repo.dart';
import 'package:wallpaper_ui/models/wallpaper_model.dart';

part 'trending_wal_state.dart';

class TrendingWalCubit extends Cubit<TrendingWalState> {
  WallPaperRepository wallPaperRepository;

  TrendingWalCubit({required this.wallPaperRepository}) : super(TrendingWalInitialState());

  void getTrendingWallPaper() async{
    emit(TrendingWalLoadingState());

    try{
      var data = await wallPaperRepository.getCuratedWallPaper();
      var wallpaperModel = DataPhotoModel.fromJson(data);
      emit(TrendingWalLoadedState(listPhotos: wallpaperModel.photos!));
    } catch(e){
      emit(TrendingWalErrorState(errMsg: e.toString()));
    }
  }
}
