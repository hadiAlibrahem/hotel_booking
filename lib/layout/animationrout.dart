import 'package:flutter/cupertino.dart';

class SlideRight extends PageRouteBuilder{
  final page;
  SlideRight({this.page})
      :super(
      pageBuilder:(context,animation,animationtwo)=>page ,
      transitionsBuilder:(context,animation,animationtwo,child)
      {
        var begin= Offset(1.0,0.0);
        var end= Offset(0.0,0.0);
        var tween=Tween(begin:begin,end:end);
        var offsetAnimation=animation.drive(tween);
        return SlideTransition(position: offsetAnimation,child: child,);
      }
  );
}