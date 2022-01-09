import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/String/resturant_home_Strings.dart';
import 'package:order/model/popularItem.dart';
import 'package:order/state/main_state.dart';
import 'package:order/view_model/resturant_home_deatils_vm/resturant_home_Detils_vm.dart';
import 'package:order/widget/common_widget/common_widget.dart';




class MostPupliurWidhet extends StatelessWidget {
  const MostPupliurWidhet({
    Key? key,
    required this.viewModel,
    required this.mainStateContoler,
  }) : super(key: key);

  final ResturantHomeDetilsVM viewModel;
  final MainStateContolre mainStateContoler;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder(
        future: viewModel.displayMostPopularBYResrurantID(mainStateContoler.selectedResturant.value.resturantId),
        builder: (context,snapShot){
          if(snapShot.connectionState ==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }else{
            var lstPoupler=snapShot.data as List<PopularItemModel> ;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(MostPopularText,style: GoogleFonts.jetBrainsMono(
                    color: Colors.black45,
                    fontWeight: FontWeight.w900,
                    fontSize: 24
                ),),
                Expanded(child:  LiveList(
                  showItemDuration: Duration(milliseconds: 350),
                  showItemInterval: Duration(milliseconds: 150),
                  reAnimateOnVisibility: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: lstPoupler.length,
                  itemBuilder: animationItemBulider((index)=>
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(lstPoupler[index].image),
                              minRadius: 40,
                              maxRadius: 60,
                            ),
                            SizedBox(height: 10,),
                            Text(lstPoupler[index].name,style: GoogleFonts.jetBrainsMono(

                            ),)
                          ],
                        ),
                      )
                  ),

                ),),
              ],
            );

          }
        },
      ),
    );
  }
}