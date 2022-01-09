import 'package:get/get.dart';
import 'package:order/model/resturant_model.dart';



class MainStateContolre extends GetxController{

  var selectedResturant=ResturantModel(
      paymentUrl: 'paymentUrl',
      name: 'name',
      address: 'address',
      imageUrl: 'imageUrl',
      phone: 'phone',
  resturantId: 'resturantId').obs;
}