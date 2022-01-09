import 'package:get/get.dart';
import 'package:order/model/addon_model.dart';
import 'package:order/model/size_model.dart';



class FoodDetilsStateControler extends GetxController{
  var quentity=1.obs;
  var selectedSize=SizeModel(name: 'name', price: 0).obs;
 // var selectedaddon=AddonModel(name: 'name', price: 0).obs;
  var selectedaddon=List<AddonModel>.empty(growable: true).obs;

}