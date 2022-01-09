

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:order/const/string_const.dart';
import 'package:order/model/popularItem.dart';



Future<List<PopularItemModel>> getMostPopularBYResrurantID (String resturandID) async{
  var list=List<PopularItemModel>.empty(growable: true);
  var source=await FirebaseDatabase.instance
      .reference()
      .child(RESTURANT_REF)
      .child(resturandID)
      .child(MOST_POPULAR_REF)
      .once();
  Map<dynamic,dynamic> value=source.value;
  value.forEach((key, value) {
    list.add(PopularItemModel.fromJson(jsonDecode(jsonEncode(value))));
  });

  return list;
}