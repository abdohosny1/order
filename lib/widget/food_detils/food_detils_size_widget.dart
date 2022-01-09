import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/food_deatils_String.dart';
import 'package:order/model/size_model.dart';
import 'package:order/state/food_detils_state.dart';
import 'package:order/state/food_list_state.dart';



class FoodDetailsSizeWidget extends StatelessWidget {
  const FoodDetailsSizeWidget({
    Key? key,
    required this.foodListStateControler,
    required this.foodDetilsStateControler,
  }) : super(key: key);

  final FoodListStateControler foodListStateControler;
  final FoodDetilsStateControler foodDetilsStateControler;

  @override
  Widget build(BuildContext context) {
    return    foodListStateControler.selectedControler.value.size!.length >0
        ? Card(
      elevation: 12,
      child: Container(
        width: double.infinity,
        padding:  const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(()=>ExpansionTile(
              title:  Text(sizeText,style:
              GoogleFonts.jetBrainsMono(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.blueGrey),
              ),
              children: foodListStateControler.selectedControler.value.size!
                  .map( (e) =>  RadioListTile<SizeModel>(
                  title: Text(e.name),
                  value: e,
                  groupValue: foodDetilsStateControler.selectedSize.value,
                  onChanged: (value)=>foodDetilsStateControler.selectedSize.value= value!
              ))
                  .toList(),
            )),
          ],
        ),
      ),
    )
        : Container ();
  }
}