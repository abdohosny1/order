import 'package:auto_animated/auto_animated.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/main_Strings.dart';
import 'package:order/model/resturant_model.dart';
import 'package:order/screen/resturant_home.dart';
import 'package:order/state/cart_state.dart';
import 'package:order/state/main_state.dart';
import 'package:order/style/colors.dart';
import 'package:order/view_model/main_vm/main_view_model_ibm.dart';
import 'package:order/widget/common_widget/common_widget.dart';
import 'package:order/widget/main/main_widget.dart';


class MainScreen extends StatefulWidget {

  FirebaseApp app;

  MainScreen({required this.app});
  final viewModel=MainViewModelImp();

  final mainStateContolre=Get.put(MainStateContolre());

  final cartStateControler=Get.put(CartStateControler());

  final box=GetStorage();

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {


  @override
  Widget build(BuildContext context) {
    return  Container(
      color:defultColor,
      child: SafeArea(

        child: Scaffold(
          appBar: AppBar(

            title: Text(resturantText,style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w900,color: colorWhite
            ),),
            backgroundColor: defultColor,
            elevation: 10,
          ),
          body: FutureBuilder(
            future:widget.viewModel.displayResturantList(),
            builder: (context,snapshot){
              if(snapshot.connectionState ==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else {
                var lst =snapshot.data as List<ResturantModel>;
                return Container(
                  margin: EdgeInsets.only(top: 10),
                  child: LiveList(
                    showItemDuration: Duration(milliseconds: 350),
                    showItemInterval: Duration(milliseconds: 150),
                    reAnimateOnVisibility: true,
                    scrollDirection: Axis.vertical,
                    itemCount: lst.length,
                    itemBuilder: animationItemBulider((index)=>InkWell(
                      onTap: (){
                        widget.mainStateContolre.selectedResturant.value=lst[index];
                        Get.to(()=>ResturantHome());
                      },
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height/2.5*1.2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Resturant_Image(imageUrl: lst[index].imageUrl,),
                            ResturantInof(lst: lst,index: index,)
                          ],
                        ),
                      ),
                    )),

                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
