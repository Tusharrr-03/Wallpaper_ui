part of 'trending_wal_cubit.dart';

@immutable
sealed class TrendingWalState {}

final class TrendingWalInitialState extends TrendingWalState {}
final class TrendingWalLoadingState extends TrendingWalState {}
final class TrendingWalLoadedState extends TrendingWalState {
  List<PhotoModel> listPhotos;
  TrendingWalLoadedState({required this.listPhotos});
}
final class TrendingWalErrorState extends TrendingWalState {
  String errMsg;
  TrendingWalErrorState({required this.errMsg});
}
