import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/modules/book_now/book_now.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/custom_image.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/data.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:lottie/lottie.dart';
import '../../ui/appTheme.dart';
import '../../ui/color_helper.dart';
import '../widget/round_corners_button_widget.dart';
import 'ItemBookingParkig.dart';


class BookingParking extends StatelessWidget {
  const BookingParking({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit,HotelStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return  Container(
            child: Scaffold(
              appBar: AppBar(
                actions: [
                  Padding(
                    padding: EdgeInsetsDirectional.only(end:12
                      // MediaQuery.of(context).padding.left
                    ),
                    child:IconButton(onPressed:() {
                      HotelCubit.get(context).changAppMode();
                    },
                        icon:Icon(Icons.brightness_6_outlined)
                    ),
                  ),
                ],
              ),

              body:Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                       ItemBookingParking(
                        width:double.infinity.w,
                        height:280.h,
                        onTap: (){},
                        data:parking[0],
                        onTapFavorite: () {  },
                      ),
                      Container(
                        height: 250.h,
                        width: double.infinity.w,
                        //  width: double.infinity,
                        child:Lottie.asset(
                          'assets/animation/57463-parking-concept.json',
                          width: double.infinity.w,
                          fit: BoxFit.fill,

                        ) ,
                      ),
                    RoundCornerButtonWidget(
                     // Padding_Containar: EdgeInsets.only( bottom: 10.h,left: 50.w,right: 50.w,top: 10.h),
                      key: Key('txt_get_started'),
                      title: 'Booking now',

                       onTap: () => navigateTo(context, BookNowScreen()),
                     // padding:EdgeInsets.only(left: 48.w, right: 48.w, bottom: 8.h, top: 8.h) ,
                      bgColor: AppTheme.getTheme().primaryColor ,
                      textColor:Colors.white ,


                    ),
                  ],
                ),
              ),
            )
        );
      },

    );

  }
  Widget ItemBookingParking({
    required data,
    required double width,
    required double height,
    required GestureTapCallback? onTapFavorite,
    required GestureTapCallback? onTap,
  }){

    return BlocConsumer<HotelCubit, HotelStates>(
        listener: (context, state) => {},
        builder: (context, state) {


          return GestureDetector(
            onTap: onTap,
            child: Container(
              width: width,
              height: height,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only (bottom: 5.h, top: 5.h,right: 5.w,left: 5.w),
              decoration: BoxDecoration(
                border: HotelCubit.get(context).isDark ?
                Border.all(color:
                AppTheme.newLightTheme().backgroundColor
                    .withOpacity(1),)
                    : Border.all(color:Colors.white),

                // color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: HotelCubit.get(context).isDark ? Colors.black : Colors.white,
                    // spreadRadius: 1,
                    //    blurRadius: 1,
                    //  offset: Offset(1, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 5.h,),
                  CustomImage(
                    data["image"],
                    width: double.infinity,
                    height: 200.h,
                    radius: 15,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    //width: width - 20,
                    padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data["name"],
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18.sp,
                              // color:ColorHelper.primaryColor ,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Column(
                          children: [
                            Text(
                              data["price"],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColorHelper.primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),

                            Text(
                              'Per day',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: ColorHelper.primaryColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    );

  }


}
