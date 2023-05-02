import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/ui/color_helper.dart';


class FavoriteBox extends StatelessWidget {
  FavoriteBox(
      {Key? key,
      this.bgColor = Colors.white,
      this.onTap,
      this.isFavorited = true,
      this.borderColor = Colors.transparent,
      this.radius = 50,
      this.size = 18,
      this.padding = 8})
      : super(key: key);
  final Color borderColor;
  final Color? bgColor;
  final bool isFavorited;
  final double radius;
  final double size;
  final double padding;
  final GestureTapCallback? onTap;


  @override
  Widget build(BuildContext context) {


    return BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) => {},
    builder: (context, state) {

        //  bool isFavorited=HotelCubit.get(context).getisFavorited(index);


    return GestureDetector(
      onTap:onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.all(padding),
        duration: const Duration(milliseconds: 500),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: HotelCubit.get(context).isDark?(isFavorited?Colors.red: Colors.white):(isFavorited?Colors.red:Colors.white),
      //    isFavorited ?Colors.red: Colors.white,
            border: HotelCubit.get(context).isDark ?
            Border.all(color: isFavorited?Colors.red:Colors.white   //AppTheme.newLightTheme().backgroundColor
                .withOpacity(0),)
                : Border.all(color:Colors.white),

          boxShadow: [
            BoxShadow(
             color:ColorHelper.dividerColor, //shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: SvgPicture.asset(
          isFavorited
              ? "assets/icons/favorited.svg"
              : "assets/icons/favorite.svg",
          color: isFavorited ? Colors.white :Colors.red,//primary,
          width: size.sp,
          height: size.sp,
        ),
      ),
    );
  }
  );
}}
