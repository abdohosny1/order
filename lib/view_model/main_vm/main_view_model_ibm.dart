


import 'package:order/firebase/resturant_refurance.dart';
import 'package:order/model/resturant_model.dart';
import 'package:order/view_model/main_vm/main_view_model.dart';

class MainViewModelImp implements MainViewModel{
  @override
  Future<List<ResturantModel>> displayResturantList() {
    // TODO: implement displayResturantList
   return getResturantList();
  }

}