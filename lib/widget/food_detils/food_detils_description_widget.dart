import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/state/food_list_state.dart';



class FoodDetailsDescriptionWidget extends StatelessWidget {
  const FoodDetailsDescriptionWidget({
    Key? key,
    required this.foodListStateControler,
  }) : super(key: key);

  final FoodListStateControler foodListStateControler;


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Container(
        padding : const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBar.builder(
                initialRating: 5,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: false,
                itemBuilder: (context,_){
                  return Icon(Icons.star,color: Colors.amber,);
                },
                onRatingUpdate: (value){}
            ),
            SizedBox(height: 10,),
            Text('${foodListStateControler.selectedControler.value.description}',style:
            GoogleFonts.jetBrainsMono(fontSize: 14,color: Colors.blueGrey),),


          ],

        ),

      ),
    );
  }
}