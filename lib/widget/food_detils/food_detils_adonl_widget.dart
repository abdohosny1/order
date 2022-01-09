

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/food_deatils_String.dart';
import 'package:order/state/food_detils_state.dart';
import 'package:order/state/food_list_state.dart';



class FoodDetilsAddonWidget extends StatelessWidget {
  const FoodDetilsAddonWidget({
    Key? key,
    required this.foodListStateControler,
    required this.foodDetilsStateControler,
  }) : super(key: key);

  final FoodListStateControler foodListStateControler;
  final FoodDetilsStateControler foodDetilsStateControler;

  @override
  Widget build(BuildContext context) {
    return    foodListStateControler.selectedControler.value.addon!.length >0
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
              title:  Text(addonText,style:
              GoogleFonts.jetBrainsMono(fontSize: 20,fontWeight: FontWeight.w900,color: Colors.blueGrey),
              ),
              children: [
                Wrap(
                  children: foodListStateControler.selectedControler.value.addon!
                      .map( (e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChoiceChip(
                        label: Text(e.name),
                        selected: foodDetilsStateControler.selectedaddon.contains(e),
                        selectedColor: Colors.yellow,
                        disabledColor: Colors.grey,
                        onSelected: (selected) =>selected
                            ? foodDetilsStateControler.selectedaddon.add(e)
                            :foodDetilsStateControler.selectedaddon.remove(e),
                        ),
                      )
                  )
                      .toList(),
                )
              ],
            )),
          ],
        ),
      ),
    )
        : Container ();
  }
}