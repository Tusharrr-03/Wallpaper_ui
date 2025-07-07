part of 'search__cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitialState extends SearchState {}
final class SearchLoadingState extends SearchState {}
final class SearchLoadedState extends SearchState {
  List<PhotoModel> listPhotos;
  num totalWallPapers;
  SearchLoadedState({required this.listPhotos, required this.totalWallPapers});
}
final class SearchErrorState extends SearchState {
  String errMsg;
  SearchErrorState({required this.errMsg});
}
