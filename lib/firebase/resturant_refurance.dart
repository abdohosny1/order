

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
import 'package:order/const/string_const.dart';
import 'package:order/model/resturant_model.dart';


Future<List<ResturantModel>> getResturantList () async{
  var list=List<ResturantModel>.empty(growable: true);
  var source=await FirebaseDatabase.instance.reference().child(RESTURANT_REF).once();
  Map<dynamic,dynamic> value=source.value;
  ResturantModel? resturantModel;
  value.forEach((key, value) {
    resturantModel=ResturantModel.fromJson(jsonDecode(jsonEncode(value)));
    resturantModel!.resturantId=key;
    list.add(resturantModel!);
  });

  return list;
}