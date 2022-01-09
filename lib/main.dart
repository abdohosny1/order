import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:order/const/string_const.dart';
import 'package:order/network/cash_Helper.dart';
import 'package:order/screen/MainScreen.dart';
import 'package:order/screen/OnBorderingScreen.dart';
import 'package:order/style/them_style.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app=await Firebase.initializeApp();
  await GetStorage.init();
  await CashHelper.init();
  //late bool OnBoredering=CashHelper.getDate(key: 'OnBoredering');
  //token=CashHelper.getDate(key: 'token');
  Widget widget=OnBorderingScreen(app:app);
  // if(OnBoredering !=null){
  //   widget=MainScreen(app: app,);
  // //   if(token !=null) widget=MainScreen(app: app,);
  // //   else widget =MainScreen(app: app,);
  // }else{
  //   widget=OnBorderingScreen();
  // }

  runApp(MyApp(satartWidget:widget,app: app,));
}

class MyApp extends StatelessWidget {
  final Widget satartWidget;
  FirebaseApp app;
  MyApp({required this.satartWidget,required this.app});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Order',
      theme: lightThem,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home:  satartWidget
        //OnBoredering?LoginScreen()  :OnBorderingScreen()

    );
  }
}


