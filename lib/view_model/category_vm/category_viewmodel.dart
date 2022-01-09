


import 'package:order/model/categoryModel.dart';

abstract class CategoryViewModel{
  Future<List<CategoryModel>> displayCategoryByResturantId(String  resturandId);
}