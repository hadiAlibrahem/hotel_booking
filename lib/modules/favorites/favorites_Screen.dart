// ignore_for_file: file_names, prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/custom_image.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/favorite_box.dart';

import '../../shared/compoment/components.dart';
import '../../shared/style/color.dart';
import '../../ui/appTheme.dart';



// ignore: use_key_in_widget_constructors
class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit,HotelStates>(
      listener: (context, state) {},
      builder: (context, state) {

        return  ListView.separated(
          itemCount:HotelCubit.get(context).features.length,
          separatorBuilder: (context, index) {return SizedBox(height: 10,);},

          itemBuilder: (context, index) {
            return ConditionalBuilder
              (
              condition:HotelCubit.get(context).features[index]['is_favorited']==true ,

              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 130.0.h,
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
                                // Image(
                                //   image: NetworkImage(
                                //     HotelCubit.get(context).features[index]['image'],
                                //   ),
                                //   fit: BoxFit.cover,
                                //   width: 120.0,
                                //   height: 120.0,
                                // ),
                                //   if (model.discount != 0 && isOldPrice)
                                // Container(
                                //   color: Colors.red,
                                //   child: Padding(
                                //     padding: const EdgeInsets.symmetric(horizontal: 5.0),
                                //     child: Text(
                                //       'DISCOUNT',
                                //       style: TextStyle(
                                //         fontSize: 8.0,
                                //         color: Colors.white,
                                //       ),
                                //     ),
                                //   ),
                                // ),
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
                                  // style: TextStyle(
                                  //   height: 1.3.h,
                                  //   fontSize: 13.0,
                                  // ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      HotelCubit.get(context).features[index]['price']!,
                                      style: TextStyle(
                                        fontSize: 11.0,
                                        color: defaultColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    // if (model.discount != 0 && isOldPrice)
                                    Text(
                                      HotelCubit.get(context).features[index]['price']!,

                                      style: TextStyle(
                                        fontSize: 10.0,
                                        color: Colors.grey,
                                        //  decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Spacer(),
                                    FavoriteBox(
                                      size: 17,
                                      onTap:
                                          () {
                                        return  HotelCubit.get(context).ChangisFavorited(index);
                                      }, //navigateTo(context, LoginPage()),
                                      //onTapFavorite,
                                      isFavorited: HotelCubit.get(context).features[index]['is_favorited']!,

                                      //["is_favorited"]

                                    )
                                  ],
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
              fallback:(context)=>SizedBox(height: 2,),
                  // Center(child: CircularProgressIndicator()),
            );



          },

        );

      },
    );
  }
}

