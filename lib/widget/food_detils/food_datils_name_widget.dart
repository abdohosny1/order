import 'package:flutter/material.dart';
import 'package:flutter_elegant_number_button/flutter_elegant_number_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/state/food_detils_state.dart';
import 'package:order/state/food_list_state.dart';



class FoodDetilsNameWidget extends StatelessWidget {
  const FoodDetilsNameWidget({
    Key? key,
    required this.foodListStateControler,
    required this.foodDetilsStateControler,
  }) : super(key: key);

  final FoodListStateControler foodListStateControler;
  final FoodDetilsStateControler foodDetilsStateControler;

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
            Text('${foodListStateControler.selectedControler.value.name}',style:
            GoogleFonts.jetBrainsMono(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.blueGrey),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${foodListStateControler.selectedControler.value.price}',style:
                GoogleFonts.jetBrainsMono(fontSize: 16,color: Colors.blueGrey),),
                Obx(()=>ElegantNumberButton(
                    initialValue: foodDetilsStateControler.quentity.value,
                    minValue: 1,
                    maxValue: 100,
                    color: Colors.amber,
                    onChanged: (value)=>foodDetilsStateControler.quentity.value=value.toInt(),
                    decimalPlaces: 0)),
              ],
            )
          ],

        ),

      ),
    );
  }
}