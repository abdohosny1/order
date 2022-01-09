import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CartTotalItemWidget extends StatelessWidget {

  CartTotalItemWidget({required this.value,required this.text,required this.IsSubTotal});
  final String text;
  final String value;
  final bool IsSubTotal;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text,style: GoogleFonts.jetBrainsMono(
            fontSize: IsSubTotal ? 20: 16,
            fontWeight: FontWeight.bold,
             color: IsSubTotal ?Colors.red:Colors.black),),
        Text(value,
          style: GoogleFonts.jetBrainsMono(
              fontSize: IsSubTotal ?20 :16,
              fontWeight: FontWeight.bold,
              color: IsSubTotal ?Colors.red:Colors.black),),
      ],
    );
  }
}