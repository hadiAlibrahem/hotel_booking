import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/admin_modeues/admin_screen.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/modules/Booking_Convention_Hall/convention_hall_screen.dart';
import 'package:hotel_booking/modules/Parking/BookingParkig.dart';
import 'package:hotel_booking/modules/booking_room1/booking_room1.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/color_helper.dart';
import 'package:hotel_booking/ui/text_styles.dart';
import '../../shared/compoment/components.dart';
import '../widget/round_corners_button_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    int stare=4;
    return BlocConsumer<HotelCubit,HotelStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: HotelCubit.get(context).isDark?
          AppTheme.newDarkTheme().scaffoldBackgroundColor:AppTheme.newLightTheme().scaffoldBackgroundColor,
          body:Container(
            width: double.infinity.w,
            height: double.infinity.h,
            child: Stack (
           // alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity.w,
                     height:380.h,
                    child: Image.asset(
                        'assets/images/home3.jpg',
                        fit: BoxFit.fill),
                  ),
                ),
                Positioned(
                  top: 220.0.h,
                  left:20.w,

                  child: Text(
                    'welcom in your home',
                      style: TextStyle(
                        fontSize: 24.0,
                        color:Colors.white,
                       fontWeight: FontWeight.w700,
                      ),
                    //style: TextStyles(context).getRegularStyle(),

                  ),
                ),
                Positioned(
                  top:260.h,
                  bottom: 0.h,
                  child: Container(

                    padding: EdgeInsets.all(25),
                    width: MediaQuery.of(context).size.width,

                   height: double.infinity,//MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      color: HotelCubit.get(context).isDark?Colors.black :Colors.white,
                      border: HotelCubit.get(context).isDark ? Border.all(color:AppTheme.newLightTheme().backgroundColor.withOpacity(0.5)):Border.all(color:Colors.white),

                      borderRadius: BorderRadius.only(
                        topLeft:  Radius.circular(30.h),
                        topRight: Radius.circular(30.h),
                      ),

                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                       //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  color:AppTheme.primaryColors,
                              ),
                              SizedBox(width: 7.w,),
                              Text(
                                'syria ,aleppo',
                                style:TextStyles(context).getRegularStyle(),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Wrap(
                            children:List.generate(5,
                                    (index) {
                              return Icon(Icons.star,color:index<stare?ColorHelper.starColor:Colors.grey);
                                    }
                                    ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            'Discription:',
                            style:TextStyles(context).getBoldStyle(),

                          ),
                          SizedBox(height: 8.h,),
                          Text(
                            'Whate do you need to book in my hotel:',
                            style:TextStyles(context).getDescriptionStyle(),
                          ),
                          SizedBox(height: 10.h,),
                          RoundCornerButtonWidget(
                            //Padding_Containar: EdgeInsets.only( bottom: 10,left: 45,right: 45,top: 10),
                            key: Key('txt_get_started'),
                            title: 'Booking Room',
                             onTap: () => navigateTo(context, BookingRoom1()),
                           // padding:const EdgeInsets.only(left: 45, right: 45, bottom: 10, top: 10) ,
                            bgColor: AppTheme.getTheme().primaryColor ,
                            textColor:Colors.white ,

                          ),
                          SizedBox(height:15.h,),
                          RoundCornerButtonWidget(
                           // Padding_Containar: EdgeInsets.only( bottom: 10,left: 45,right: 45,top: 10),
                            key: Key('txt_get_'),
                            title: 'Booking a car park',
                            onTap: () => navigateTo(context, BookingParking()),
                            //padding:const EdgeInsets.only(left: 48, right: 48, bottom: 8, top: 8) ,
                            bgColor: AppTheme.getTheme().primaryColor ,
                            textColor:Colors.white ,


                          ),
                          SizedBox(height:15.h,),
                          RoundCornerButtonWidget(
                           // Padding_Containar: EdgeInsets.only( bottom: 10,left: 50,right: 50,top: 10),
                            key: Key('txt_get_starte'),
                            title: 'Booking a class room',
                             onTap: () => navigateTo(context,
                                 AdminScreen(),
                                 //ConventionHallScreen()
                             ),
                         //   padding:const EdgeInsets.only(left: 48, right: 24, bottom: 8, top: 8) ,
                            bgColor: AppTheme.getTheme().primaryColor ,
                            textColor:Colors.white ,


                          ),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),


        );
      },
    );
  }
}