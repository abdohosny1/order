

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:order/const/string_const.dart';
import 'package:order/model/categoryModel.dart';




Future<List<CategoryModel>> getCategoryByResrurantId (String resturandid) async{
  var list=List<CategoryModel>.empty(growable: true);
  var source=await FirebaseDatabase.instance
      .reference()
      .child(RESTURANT_REF)
      .child(resturandid)
      .child(CATEGORY_REF)
      .once();
  Map<dynamic,dynamic> value=source.value;
  value.forEach((key, value) {
    list.add(CategoryModel.fromJson(jsonDecode(jsonEncode(value))));
  });

  return list;
}