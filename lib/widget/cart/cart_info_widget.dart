import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/model/cart_model.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/utils/utils.dart';



class Cart_Info_Widget extends StatelessWidget {
  const Cart_Info_Widget({
    Key? key,
    required this.cartStateControler,
    required this.model,
  }) : super(key: key);

  final CartStateControler cartStateControler;
  final CartModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(model.name,
              style: GoogleFonts.jetBrainsMono(
                fontSize: 16,fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.monetization_on,color: Colors.grey,size: 16,),
                SizedBox(width: 4,),
                Text('${currencyFormat.format(model.price)}',
                  style: GoogleFonts.jetBrainsMono(
                    fontSize: 16,fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}