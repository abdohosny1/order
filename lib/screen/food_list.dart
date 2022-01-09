import 'package:auto_animated/auto_animated.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/food_list_String.dart';
import 'package:order/const/string_const.dart';
import 'package:order/screen/food_details.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/state/category_state.dart';
import 'package:order/state/food_list_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/view_model/category_vm/category_viewmodel.dart';
import 'package:order/view_model/category_vm/category_viewmodel_imp.dart';
import 'package:order/widget/common_widget/appbar_with_cart_widget.dart';
import 'package:order/widget/common_widget/common_widget.dart';




class FoodListScreen extends StatelessWidget {
  final CategoryViewModel viewModel=CategoryViewModelImp();
  final CategoryStateControler categoryStateControler=Get.find();
  final FoodListStateControler foodListStateControler=Get.put(FoodListStateControler());
  final CartStateControler cartStateControler=Get.find();
  final MainStateContolre mainStateContolre=Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBarWithCartButton(title:'${categoryStateControler.selectedCategory.value.name}',textsize: false,),
        body:  Column(
          children: [
            Expanded(
              child: LiveList(
                physics: BouncingScrollPhysics(),
                  showItemInterval: Duration(milliseconds: 300),
                  showItemDuration: Duration(milliseconds: 300),
                  reAnimateOnVisibility: true,
                  scrollDirection: Axis.vertical,
                  itemCount: categoryStateControler.selectedCategory.value.foods!.length,

                  itemBuilder:animationItemBulider((index)=>
                      InkWell(
                    onTap: (){
                      // categoryStateControler.selectedCategory.value=lst[index];
                      // Get.to(()=>FoodListScreen());

                      foodListStateControler.selectedControler.value=
                      categoryStateControler.selectedCategory.value.foods![index];
                      Get.to(FoodDetailsScreen());


                    },
                    child: Hero(
                      tag: categoryStateControler.selectedCategory.value.foods![index].name,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height/6*2.5,
                        child:Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  errorWidget: (context,url,error)=>Center(child: Icon(Icons.image),),
                                  imageUrl: categoryStateControler.selectedCategory.value.foods![index].image,fit: BoxFit.cover,
                                  progressIndicatorBuilder: (context,url,dow)=>Center(child: CircularProgressIndicator(),),

                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    color: COLOR_OVERLAY,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.only(top: 10,bottom: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [

                                                  Text(categoryStateControler.selectedCategory.value.foods![index].name,textAlign: TextAlign.center,style: GoogleFonts.jetBrainsMono(
                                                      color: Colors.white,fontSize: 18
                                                  ),),
                                                  Text('$PRICETEXT: \$${categoryStateControler.selectedCategory.value.foods![index].price}',textAlign: TextAlign.center,style: GoogleFonts.jetBrainsMono(
                                                      color: Colors.white,fontSize: 18
                                                  ),),
                                                  Row(
                                                    children: [
                                                      IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,color: Colors.white,)),
                                                      SizedBox(width: 50,),
                                                       IconButton(onPressed: (){
                                                         cartStateControler.addToCart(categoryStateControler.selectedCategory.value.foods![index],mainStateContolre.selectedResturant.value.resturantId) ;

                                                       }, icon: Icon(Icons.add_shopping_cart,color: Colors.white,)),
                                                    ],
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )

                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ),
                    ),
                  )) ,

                 ),
            )
          ],
        )

    );
  }
}
