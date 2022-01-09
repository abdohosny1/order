
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double foodDetilsImageAreaSize(context){
  return MediaQuery.of(context).size.height/3;

}

final currencyFormat=NumberFormat.simpleCurrency();

int createOrderNumber(int original){
  return original + Random().nextInt(1000);
}

double calculateFinalPayment(double subTotal,double discout){
  return subTotal -(subTotal*(discout/100));
}

String convertToDate(int data)=>DateFormat('dd-MM-yyy HH:mm').
format(DateTime.fromMillisecondsSinceEpoch(data));

String convertToSatus(int status) =>status==0 ?'Placed' :status ==1?'Shipping':status==2?'Shipped' :'Cancelled';

MaterialColor convertStatusToColors (int statusOrder)=>
    statusOrder == -1 ? Colors.red
        :statusOrder == 0 ?Colors.blue
        : statusOrder == 1 ?Colors.yellow :Colors.lightGreen;
