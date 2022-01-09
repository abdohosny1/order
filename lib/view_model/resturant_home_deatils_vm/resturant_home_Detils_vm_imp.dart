

import 'package:order/firebase/best_deais_referance.dart';
import 'package:order/firebase/popular_referance.dart';
import 'package:order/model/popularItem.dart';
import 'package:order/view_model/resturant_home_deatils_vm/resturant_home_Detils_vm.dart';


class ResturantHomeDetilsVMIMp extends ResturantHomeDetilsVM{
  @override
  Future<List<PopularItemModel>> displayMostPopularBYResrurantID(String resturandID) {
    // TODO: implement getMostPopularBYResrurantID
   return getMostPopularBYResrurantID(resturandID);
  }

  @override
  Future<List<PopularItemModel>> displayBestDealBYResrurantID(String resturandID) {
    // TODO: implement displayBestDealBYResrurantID
    return getBestDealByResrurantId(resturandID);
  }
  
}