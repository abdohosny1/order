import 'package:get/get.dart';
import 'package:order/model/foodModel.dart';


class FoodListStateControler extends GetxController{
  var selectedControler=FoodModel(
      description: 'description',
      image: 'image',
      name: 'name',
      id: 'id',
      price: 0,
      size: [],
      addon: []).obs;
}