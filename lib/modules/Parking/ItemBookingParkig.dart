import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/custom_image.dart';
import '../../ui/appTheme.dart';
import '../../ui/color_helper.dart';

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
            margin: EdgeInsets.only(bottom: 5.h, top: 5.h,right: 5.w,left: 5.w),
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
                  radius: 15.w,
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






//
//
// class ItemBookingParking extends StatelessWidget {
//   ItemBookingParking(
//       {Key? key,
//         required this.data,
//         //this.width = 280,
//         required this.width ,
//         required this.height,
//         required this.onTap,
//         this.onTapFavorite}) : super(key: key);
//   final data;
//   final double width;
//   final double height;
//   final GestureTapCallback? onTapFavorite;
//   final GestureTapCallback? onTap;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<HotelCubit, HotelStates>(
//         listener: (context, state) => {},
//         builder: (context, state) {
//
//
//           return GestureDetector(
//             onTap: onTap,
//             child: Container(
//               width: width,
//               height: height,
//               padding: EdgeInsets.all(10),
//               margin: EdgeInsets.only(bottom: 5, top: 5,right: 5,left: 5),
//               decoration: BoxDecoration(
//
//                 border: AppCubit.get(context).isDark ?
//                 Border.all(color:
//                 AppTheme.newLightTheme().backgroundColor
//                     .withOpacity(1),)
//                     : Border.all(color:Colors.white),
//
//                 // color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                     color: AppCubit.get(context).isDark ? Colors.black : Colors.white,
//                     // spreadRadius: 1,
//                     //    blurRadius: 1,
//                     //  offset: Offset(1, 1), // changes position of shadow
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 5,),
//                   CustomImage(
//                     data["image"],
//                     width: double.infinity,
//                     height: 200,
//                     radius: 15,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     //width: width - 20,
//                     padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           data["name"],
//                           maxLines: 1,
//                           overflow: TextOverflow.ellipsis,
//                           style: TextStyle(
//                               fontSize: 18,
//                               // color:ColorHelper.primaryColor ,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       Spacer(),
//                         Column(
//                           children: [
//                             Text(
//                               data["price"],
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   color: ColorHelper.primaryColor,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600),
//                             ),
//
//                             Text(
//                              'Per day',
//                               maxLines: 1,
//                               overflow: TextOverflow.ellipsis,
//                               style: TextStyle(
//                                   color: ColorHelper.primaryColor,
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           );
//         }
//     );
//   }
//
// }