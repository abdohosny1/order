import 'package:get/get.dart';
import 'package:order/model/categoryModel.dart';



class CategoryStateControler extends GetxController{
  var selectedCategory=CategoryModel(name: 'name', image: 'image', foods: []).obs;

}