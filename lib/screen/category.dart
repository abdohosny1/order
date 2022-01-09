import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/resturant_home_Strings.dart';
import 'package:order/model/categoryModel.dart';
import 'package:order/state/category_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/view_model/category_vm/category_viewmodel.dart';
import 'package:order/view_model/category_vm/category_viewmodel_imp.dart';
import 'package:order/widget/category/category_list_widget.dart';
import 'package:order/widget/common_widget/appbar_with_cart_widget.dart';



class CategoryScreen extends StatelessWidget {

  final CategoryViewModel viewModel=CategoryViewModelImp();
  final MainStateContolre mainStateContolre=Get.find();
  final CategoryStateControler categoryStateControler=Get.put(CategoryStateControler());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBarWithCartButton(title: '$categoriesText- ${mainStateContolre.selectedResturant.value.name} ',textsize: true,),

      body: FutureBuilder(
        future:viewModel.displayCategoryByResturantId(
            mainStateContolre.selectedResturant.value.resturantId),
        builder: (context,snapshot){
          if(snapshot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator());
          }else {
           var lst =snapshot.data  as  List<CategoryModel>;
            print( 'data = ${snapshot.data}');
            return Container(
              margin: EdgeInsets.only(top: 10),
              child:
              CategoryListWidget(lst: lst,categoryStateControler: categoryStateControler,),
            );
          }
        },
      )
      );
  }
}


