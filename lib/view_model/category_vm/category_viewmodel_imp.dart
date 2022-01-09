



import 'package:order/firebase/category_referance.dart';
import 'package:order/model/categoryModel.dart';

import 'category_viewmodel.dart';

class CategoryViewModelImp extends CategoryViewModel {
  @override
  Future<List<CategoryModel>> displayCategoryByResturantId(String resturandId) {
    return getCategoryByResrurantId(resturandId);
  }

}