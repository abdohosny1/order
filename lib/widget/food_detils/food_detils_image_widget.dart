import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:order/const/string_const.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/state/food_detils_state.dart';
import 'package:order/state/food_list_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/utils/utils.dart';



class FoodDetailsImageWidget extends StatelessWidget {
   FoodDetailsImageWidget({
    Key? key,
    required this.foodListStateControler,
  }) : super(key: key);

  final FoodListStateControler foodListStateControler;
  final CartStateControler cartStateControler=Get.find();
  final MainStateContolre mainStateContolre=Get.find();
  final FoodDetilsStateControler foodDetilsStateControler=Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height:foodDetilsImageAreaSize(context)*0.9 ,
          child:   Hero(
            tag: foodListStateControler.selectedControler.value.name,
            child: CachedNetworkImage(
              errorWidget: (context,url,error)=>Center(child: Icon(Icons.image),),
              imageUrl: foodListStateControler.selectedControler.value.image,fit: BoxFit.cover,
              progressIndicatorBuilder: (context,url,dow)=>Center(child: CircularProgressIndicator(),),

            ),
          ),

        ),
        Align(
          alignment:const Alignment(0.8,1),
          heightFactor: 0.5,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  heroTag: FAV_FAB_TAG,
                  onPressed: (){},
                  child: Icon(Icons.favorite_border,color: Colors.black,),
                  backgroundColor: Colors.white,
                  elevation: 10,

                ),
                 FloatingActionButton(
                   heroTag: CART_FAB_TAG,
                   onPressed: ()=>cartStateControler.addToCart(foodListStateControler.selectedControler.value,
                       mainStateContolre.selectedResturant.value.resturantId,
                   quantity: foodDetilsStateControler.quentity.value),
                   child: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
                   backgroundColor: Colors.white,
                   elevation: 10,

                 ),
              ],
            ),
          ),
        )
      ],
    );
  }
}