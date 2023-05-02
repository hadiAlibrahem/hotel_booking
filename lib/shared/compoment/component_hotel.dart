import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/modules/Parking/BookingParkig.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/icon_box.dart';
import 'package:hotel_booking/modules/booking_room/classic_room.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/color_helper.dart';
import 'package:hotel_booking/ui/text_styles.dart';

import 'components.dart';

class OfferModel {
  final String? assetName;
  final String? titel;
  OfferModel({
    required this.assetName,
    required this.titel,
  });
}

List<OfferModel> Offer = [
  OfferModel(
      assetName: "assets/icons/bed-single-svgrepo-com.svg",
      titel: 'single bed'),
  OfferModel(assetName: "assets/icons/car-svgrepo-com.svg", titel: 'barking'),
  OfferModel(
      assetName: "assets/icons/wifi-high-svgrepo-com.svg", titel: 'Wifi'),
  OfferModel(
      assetName: "assets/icons/food-holidays-meal-svgrepo-com.svg",
      titel: 'snack'),
  OfferModel(assetName: "assets/icons/pool-svgrepo.svg", titel: 'pool'),
];


Widget BuildOfferItem(OfferModel model, context, index) => Container(
      margin: EdgeInsets.only(right: 10.0.w,),
      width: 90.0.w,
      height: 90.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: HotelCubit.get(context).isDark ? Colors.black : Colors.white,
        border: HotelCubit.get(context).isDark
            ? Border.all(
                color: AppTheme.newLightTheme().backgroundColor.withOpacity(1))
            : Border.all(color: Colors.white),
      ),

      // color: ColorHelper.dividerColor,

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            IconBox(
              onTap: () {
                if (index == 1) {
                  navigateTo(context, BookingParking());
                }
              },

              child: SvgPicture.asset(
                '${model.assetName}',

                height: 20.h,
                width: 20.w,

                color: ColorHelper.primaryColor, //primary,
              ),

              //bgColor: Colors.white,
            ),
            SizedBox(
              height: 5.0.h,
            ),
            Text(
              '${model.titel}',
              //style:TextStyles(context).getDescriptionStyle(),

            ),
          ],
        ),
      ),
    );

Widget BuildBoardingItem(BoardingModel model, context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: HotelCubit.get(context).isDark ? Colors.black : Colors.white,
              border: HotelCubit.get(context).isDark
                  ? Border.all(
                      color: AppTheme.newLightTheme()
                          .backgroundColor
                          .withOpacity(1))
                  : Border.all(color: Colors.white),
            ),
            child: Image(

              image: AssetImage('${model.image}'),
              fit: BoxFit.cover,
              width: double.infinity.w,
            ),
          ),
        ),
      ],
    );
