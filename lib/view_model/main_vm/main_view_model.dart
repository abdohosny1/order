

import 'package:order/model/resturant_model.dart';

abstract class MainViewModel{
  Future<List<ResturantModel>> displayResturantList ();
}