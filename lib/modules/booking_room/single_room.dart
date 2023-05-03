import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/modules/Parking/BookingParkig.dart';
import 'package:hotel_booking/modules/book_now/book_now.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/favorite_box.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/icon_box.dart';
import 'package:hotel_booking/modules/login/login_page.dart';
import 'package:hotel_booking/modules/widget/round_corners_button_widget.dart';
import 'package:hotel_booking/shared/compoment/component_hotel.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/color_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
class BoardingModel {
  final String? image;
  // final String? titel;
  // final String? body;

  BoardingModel({
    required this.image,
    // required this.titel,
    //required this.body,
  });
}


class SingleRoom extends StatelessWidget {
int index;
  SingleRoom(this.index):super();


  bool isLast = false;
var BoardController = PageController();
List<BoardingModel> boarding = [
  BoardingModel(
    image: 'assets/images/hotel_room_1.jpg',
  ),
  BoardingModel(
    image: 'assets/images/hotel_room_2.jpg',
  ),
  BoardingModel(
    image: 'assets/images/hotel_room_3.jpg',
  ),
  BoardingModel(
    image: 'assets/images/hotel_room_4.jpg',
  ),
];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HotelCubit,HotelStates>(
      listener: (context,state){},
      builder: (context,state){
        return  Scaffold(
          appBar: AppBar(
            title: Text(
              'Single Room'
            ),
          ),
          body:Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: HotelCubit.get(context).isDark ? Colors.black : Colors.white,
                          border: HotelCubit.get(context).isDark
                              ? Border.all(
                              color: AppTheme.newLightTheme()
                                  .backgroundColor
                                  .withOpacity(1))
                              : Border.all(color: Colors.white),
                        ),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        height: 250.0.h,
                        width:double.infinity,
                        child: PageView.builder(
                          onPageChanged: (int index) {
                            if (index == boarding.length - 1) {
                              setState() {
                                isLast = true;
                              }
                            } else {
                              setState() {
                                isLast = false;
                              }
                            }
                          },
                          physics: BouncingScrollPhysics(),
                          controller: BoardController,
                          itemBuilder: (context, index) =>
                              BuildBoardingItem(boarding[index],context),
                          itemCount: boarding.length,
                        ),
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 10.0.h,
                              left: 20.0.w,
                            ),
                            child: SmoothPageIndicator(
                              controller: BoardController,
                              count:boarding.length,
                              effect: WormEffect(
                                dotColor: AppTheme.getTheme().dividerColor,
                                dotHeight: 12,
                                dotWidth: 12,
                                spacing: 5.0,
                                radius: 10.0,
                               // expansionFactor: 4,
                                activeDotColor: AppTheme.getTheme().primaryColor,
                              ),
                            ),
                          ),
                          Spacer(),
                          FavoriteBox(
                              size: 16,
                              onTap:()
                              {
                                HotelCubit.get(context).ChangisFavorited(index);
                              },//onTapFavorite,
                            isFavorited: HotelCubit.get(context).getisFavorited(index),//data["is_favorited"],
                            ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),
                  Row(
                    children: [
                      Text(
                        'Single Room',
                        style:  TextStyle(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w600,
                          //  color: Colors.black,
                        ),//Theme.of(context).textTheme.bodyText1,

                      ),
                      Spacer(),
                      Column(
                        children: [
                          Text(
                            '\$200.',
                            style: TextStyle(
                              fontSize: 18.0.sp,
                              fontWeight: FontWeight.w600,
                              //  color: Colors.red,
                            ),
                          ),
                          Text(
                            'per night',
                            style: TextStyle(
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w400,
                              //  color:ColorHelper.dividerColor,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15.0.h,
                  ),


                   Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Whate they offer ',
                        style: TextStyle(
                          fontSize: 22.0.sp,
                          fontWeight: FontWeight.w600,
                          //color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      SingleChildScrollView(
                        scrollDirection:Axis.horizontal,
                        child: Wrap(
                            children:

                            // ListView.separated(
                            //         itemBuilder:(context,index)=> BuildOfferItem(Offer[index],context,index),
                            //         separatorBuilder:(context,index)=> SizedBox(width: 5,) ,
                            //         itemCount: Offer.length,
                            //     ),

                              List.generate(
                                Offer.length,
                                    (index) {
                                      return BuildOfferItem(Offer[index],context,index);
                                    }, ),

                        ),
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      Text(
                        'Discription ',
                        style: TextStyle(
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w500,
                          //   color: Colors.black54,
                        ),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Text(
                        'you can book a barking when you cklick an him icon ',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w400,
                          // color: Colors.black54,

                        ),
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      RoundCornerButtonWidget(
                        title: 'Book Now',
                        onTap: () => navigateTo(context, BookNowScreen(index)),
                        bgColor: ColorHelper.primaryColor,
                      ),

                    ],
                  ),

                ]
            ),

          ),
        );
      },

    );
  }


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


}
