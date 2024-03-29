
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MenuWidgetCallback extends StatelessWidget {
  late  String menuName;
  late Function(BuildContext context) callback;
  late IconData icon;


  MenuWidgetCallback({required this.menuName,required this.callback,required this.icon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>callback(context),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width: 30,),
            Text(menuName,style: GoogleFonts.jetBrainsMono(
                fontSize: 18,color: Colors.white,fontWeight: FontWeight.w900
            ),)
          ],
        ),
      ),
    );
  }
}