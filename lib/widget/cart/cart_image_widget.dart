import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:order/model/cart_model.dart';
import 'package:order/state/cart_state.dart';



class Cart_image_Widget extends StatelessWidget {
  const Cart_image_Widget({
    Key? key,
    required this.cartStateControler,
    required this.model
  }) : super(key: key);

  final CartStateControler cartStateControler;
  final CartModel model;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      errorWidget: (context,url,error)=>Center(child: Icon(Icons.image),),
      imageUrl: model.image,
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context,url,dow)=>Center(child: CircularProgressIndicator(),),

    );
  }
}