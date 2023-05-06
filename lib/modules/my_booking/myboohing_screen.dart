import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/custom_image.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/favorite_box.dart';
import 'package:hotel_booking/shared/style/color.dart';
import 'package:hotel_booking/ui/appTheme.dart';

class MyBokingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit,HotelStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return  Scaffold(
          body: ListView.separated(
            itemCount:HotelCubit.get(context).features.length,
            separatorBuilder: (context, index) {return SizedBox(height: 10,);},

            itemBuilder: (context, index) {
              return ConditionalBuilder
                (
                condition:true ,

                builder: (context) {
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(

                      height: 150.0.h,
                      decoration: BoxDecoration(

                        border: HotelCubit.get(context).isDark ?
                        Border.all(color: AppTheme.newLightTheme().backgroundColor
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 5,),

                            child: Stack(
                                alignment: AlignmentDirectional.bottomStart,
                                children: [

                                  CustomImage(
                                    HotelCubit.get(context).features[index]['image']!,
                                    width: 120,
                                    height: 120,
                                    radius: 15,
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(start: 20.w,top: 10.h,end: 10.h,bottom: 10.w),
                              child: Column(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  SizedBox(
                                    height: 5.0.h,
                                  ),
                                  Text(
                                    HotelCubit.get(context).features[index]['name']!,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,

                                  ),
                                  SizedBox(
                                    height: 25.0.h,
                                  ),
                                  Text(
                                    //'kjsbcvhkasdjbvahkcsbv'
                                    'StartDate : ${HotelCubit.get(context).features[index]['startDate']!}'
                                     ,
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: defaultColor,
                                    ),
                                  ),

                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  // if (model.discount != 0 && isOldPrice)
                                  Text(
                                    'EndDate : ${HotelCubit.get(context).features[index]['endDate']}',
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: defaultColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8.0.h,
                                  ),
                                  Text(
                                    'Number of room  : ${ HotelCubit.get(context).features[index]['room']}',

                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: defaultColor,
                                      //  decoration: TextDecoration.lineThrough,
                                    ),
                                  ),

                                  SizedBox(
                                   height: 10.0,
                                  ),
                                  // if (model.discount != 0 && isOldPrice)
                                  Text(
                                    HotelCubit.get(context).features[index]['price']!,
                                    style: TextStyle(
                                      fontSize: 11.0,
                                      color: defaultColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  );

                },
                fallback:(context)=> Center(child: CircularProgressIndicator()),
                // Center(child: CircularProgressIndicator()),
              );



            },

          ),
        );
      },
    );
  }
}