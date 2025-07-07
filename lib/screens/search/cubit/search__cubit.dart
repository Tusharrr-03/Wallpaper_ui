import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wallpaper_ui/data/repository/wallpaper_repo.dart';
import 'package:wallpaper_ui/models/wallpaper_model.dart';

part 'search__state.dart';

class SearchCubit extends Cubit<SearchState> {
  WallPaperRepository wallPaperRepository;
  SearchCubit({required this.wallPaperRepository}) : super(SearchInitialState());

  void getSearchWallPaper({required String query, String color = "" , int page = 1}) async{
    emit(SearchLoadingState());
    
    try{
      var data = await wallPaperRepository.getSearchWallPaper(query, mColor: color , mPage : page);
      DataPhotoModel dataPhotoModel = DataPhotoModel.fromJson(data);
      emit(SearchLoadedState(listPhotos: dataPhotoModel.photos! ,totalWallPapers: dataPhotoModel.total_results!));
    } catch(e){
      emit(SearchErrorState(errMsg: e.toString()));
    }
  }

}
