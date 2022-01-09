import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order/model/resturant_model.dart';



class Resturant_Image extends StatelessWidget {
  const Resturant_Image({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);


  final  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 250,child: Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: CachedNetworkImage(
        errorWidget: (context,url,error)=>Center(child: Icon(Icons.image),),
        imageUrl: imageUrl,fit: BoxFit.cover,
        progressIndicatorBuilder: (context,url,dow)=>Center(child: CircularProgressIndicator(),),

      ),
    ),);
  }
}

class ResturantInof extends StatelessWidget {
  const ResturantInof({
    Key? key,
    required this.lst,
    required this.index,
  }) : super(key: key);

  final List<ResturantModel> lst;
  final index;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Text(lst[index].name,style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w900
            ),),

            Text(lst[index].address,style: GoogleFonts.jetBrainsMono(
                fontWeight: FontWeight.w400,fontSize: 12
            ),),
          ],
        ),
      ),
    );
  }
}