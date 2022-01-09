
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/state/category_state.dart';
import 'package:order/state/food_detils_state.dart';
import 'package:order/state/food_list_state.dart';
import 'package:order/utils/utils.dart';
import 'package:order/view_model/category_vm/category_viewmodel.dart';
import 'package:order/view_model/category_vm/category_viewmodel_imp.dart';
import 'package:order/widget/food_detils/food_datils_name_widget.dart';
import 'package:order/widget/food_detils/food_detils_adonl_widget.dart';
import 'package:order/widget/food_detils/food_detils_description_widget.dart';
import 'package:order/widget/food_detils/food_detils_image_widget.dart';
import 'package:order/widget/food_detils/food_detils_size_widget.dart';



class FoodDetailsScreen extends StatelessWidget {
  final CategoryViewModel viewModel=CategoryViewModelImp();
  final CategoryStateControler categoryStateControler=Get.find();
  final FoodListStateControler foodListStateControler=Get.find();
  final FoodDetilsStateControler foodDetilsStateControler=Get.put(FoodDetilsStateControler());


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context,innerBoxIsScroled){
            return [
              SliverAppBar(
                title: Text('${foodListStateControler.selectedControler.value.name}',
                  style: GoogleFonts.jetBrainsMono(color: Colors.blueGrey),),
                elevation: 10,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                iconTheme: IconThemeData(color: Colors.black),
                bottom: PreferredSize(
                  preferredSize: Size.square(foodDetilsImageAreaSize(context)),
                  child: FoodDetailsImageWidget(foodListStateControler: foodListStateControler),
                ),
              )
            ];
          },
          body: Container(
            margin: const EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FoodDetilsNameWidget(foodDetilsStateControler: foodDetilsStateControler,foodListStateControler: foodListStateControler),
                  FoodDetailsDescriptionWidget(foodListStateControler: foodListStateControler),

                  //ceeck the food have size


                      FoodDetailsSizeWidget(foodListStateControler: foodListStateControler, foodDetilsStateControler: foodDetilsStateControler),
                      FoodDetilsAddonWidget(foodListStateControler: foodListStateControler, foodDetilsStateControler: foodDetilsStateControler),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}








