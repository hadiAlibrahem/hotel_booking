import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';

import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/ui/appTheme.dart';


class CityItem extends StatelessWidget {
  CityItem({Key? key, required this.data, this.isSelected = false, this.onTap})
      : super(key: key);
  final data;
  final bool isSelected;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit,HotelStates>(
        listener: (context, state) => {},
        builder:(context, state) {

          return   GestureDetector(
            onTap: onTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              curve: Curves.fastOutSlowIn,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: HotelCubit.get(context).isDark ?
                Border.all(color: AppTheme.newLightTheme().backgroundColor
                    .withOpacity(1),)
                    : Border.all(color:Colors.white),

                //   color: isSelected ? primary : cardColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                     color:HotelCubit.get(context).isDark ? Colors.black:Colors.white,
                    spreadRadius: 1,
                    //  blurRadius: 2,
                    //  offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                   data["name"],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                    TextStyle(
                        fontSize:15.sp,
                        fontWeight: FontWeight.bold//darker
                    ),
                  )
                ],
              ),
            ),
          );}
    );

  }
}
