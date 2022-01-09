



import 'package:order/model/popularItem.dart';

abstract class ResturantHomeDetilsVM {
  Future<List<PopularItemModel>> displayMostPopularBYResrurantID (String resturandID);
  Future<List<PopularItemModel>> displayBestDealBYResrurantID (String resturandID);
}