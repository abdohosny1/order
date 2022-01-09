import 'dart:ui';

import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/const/string_const.dart';
import 'package:order/model/categoryModel.dart';
import 'package:order/screen/food_list.dart';
import 'package:order/state/category_state.dart';
import 'package:order/widget/common_widget/common_widget.dart';



class CategoryListWidget extends StatelessWidget {
  const CategoryListWidget({
    Key? key,
    required this.lst,
    required this.categoryStateControler,
  }) : super(key: key);

  final List<CategoryModel> lst;
  final CategoryStateControler categoryStateControler;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: LiveGrid(
              physics: BouncingScrollPhysics(),
            showItemInterval: Duration(milliseconds: 300),
            showItemDuration: Duration(milliseconds: 300),
              reAnimateOnVisibility: true,
              scrollDirection: Axis.vertical,

              itemBuilder:animationItemBulider((index)=>InkWell(
                onTap: (){
                  categoryStateControler.selectedCategory.value=lst[index];
                 Get.to(()=>FoodListScreen());

                },
                child: Card(
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        CachedNetworkImage(
                          errorWidget: (context,url,error)=>Center(child: Icon(Icons.image),),
                          imageUrl: lst[index].image,fit: BoxFit.cover,
                          progressIndicatorBuilder: (context,url,dow)=>Center(child: CircularProgressIndicator(),),

                        ),
                        Container(color:COLOR_OVERLAY ,),
                        Center(child: Text(lst[index].name,textAlign: TextAlign.center,style: GoogleFonts.jetBrainsMono(
                            color: Colors.white,fontSize: 18
                        ),),)
                      ],
                    )
                ),
              )) ,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 1,
                crossAxisSpacing: 1
              ),
              itemCount: lst.length),
        )
      ],
    );
  }
}