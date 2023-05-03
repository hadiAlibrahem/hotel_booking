import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/city_item.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/data.dart';
import 'package:hotel_booking/modules/booking_room/classic_room.dart';
import 'package:hotel_booking/modules/booking_room/double_room.dart';
import 'package:hotel_booking/modules/booking_room/family_room.dart';
import 'package:hotel_booking/modules/booking_room/junior_suite.dart';
import 'package:hotel_booking/modules/booking_room/single_room.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import '../../ui/appTheme.dart';
import 'Item_Booking_Room.dart';

class BookingRoom1 extends StatelessWidget {
  const BookingRoom1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<bool> togle = [false, false, false, false, false];

    return DefaultTabController(
      length: 6,
      child: Container(
          child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              //  indicatorColor: AppTheme.newLightTheme().primaryColor,
              labelColor: AppTheme.newLightTheme().primaryColor,
              unselectedLabelColor: HotelCubit.get(context).isDark
                  ? AppTheme.newLightTheme().backgroundColor
                  : AppTheme.newDarkTheme().backgroundColor,
              indicatorColor: Color(0xFFFfFfFf),
              isScrollable: true,
              indicator: CircleDevidor(
                  color: AppTheme.newLightTheme().primaryColor, redus: 5),
              padding: const EdgeInsetsDirectional.all(1),
              physics: ScrollPhysics(),
              tabs: [
                CityItem(
                  isSelected: true,
                  data: categories[0],
                  onTap: () {},
                ),
                CityItem(
                  isSelected: true,
                  data: categories[1],
                  onTap: () {},
                ),
                CityItem(
                  isSelected: true,
                  data: categories[2],
                  onTap: () {},
                ),
                CityItem(
                  isSelected: true,
                  data: categories[3],
                  onTap: () {},
                ),
                CityItem(
                  isSelected: true,
                  data: categories[4],
                  onTap: () {},
                ),
                CityItem(
                  isSelected: true,
                  data: categories[5],
                  onTap: () {},
                ),
              ]),
          title: Padding(
            padding:
             EdgeInsetsDirectional.only(start: 10.h, end: 10.h, top: 10.h,bottom: 10.h),
            child: Text(
              "The Best Hotel Rooms",
              style: TextStyle(
                color: AppTheme.getTheme().primaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 22.sp,
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ConditionalBuilder(
                        condition: true,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => ItemBookingRoom(
                          onTapFavorite: () {
                            HotelCubit.get(context).ChangisFavorited(index);
                            print(
                                '(((((((((${features[index]["is_favorited"]})))))))');
                          },
                          // width:570,
                          // height:287,
                          onTap: () {
                            if (index == 0)
                              navigateTo(context, SingleRoom(index));
                            else if (index == 1)
                              navigateTo(context, JuniorSuite(index));
                            else if (index == 2)
                              navigateTo(context, ClassicRoom(index));
                            else if (index == 3)
                              navigateTo(context, DoubleRoom(index));
                            else if (index == 4)
                              navigateTo(context, FamilyRoom(index));
                            else if (index == 5)
                              navigateTo(context, ClassicRoom(index));
                          },
                          data: HotelCubit.get(context).features[index],
                        ),
                      );
                    },
                    itemCount: features.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ConditionalBuilder(
                        condition: true,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => ItemBookingRoom(
                          onTapFavorite: () {
                            HotelCubit.get(context).ChangisFavorited(index);
                            print(
                                '(((((((((${features[index]["is_favorited"]})))))))');
                          },
                          // width:570,
                          // height:287,
                          onTap: () {
                            if (index == 0)
                              navigateTo(context, SingleRoom(index));
                            else if (index == 1)
                              navigateTo(context, JuniorSuite(index));
                            else if (index == 2)
                              navigateTo(context, ClassicRoom(index));
                            else if (index == 3)
                              navigateTo(context, DoubleRoom(index));
                            else if (index == 4)
                              navigateTo(context, FamilyRoom(index));
                            else if (index == 5)
                              navigateTo(context, ClassicRoom(index));
                          },
                          data: HotelCubit.get(context).features[index],
                        ),
                      );
                    },
                    itemCount: features.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ConditionalBuilder(
                        condition: true,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => ItemBookingRoom(
                          onTapFavorite: () {
                            HotelCubit.get(context).ChangisFavorited(index);
                            print(
                                '(((((((((${features[index]["is_favorited"]})))))))');
                          },
                          // width:570,
                          // height:287,
                          onTap: () {
                            if (index == 0)
                              navigateTo(context, SingleRoom(index));
                            else if (index == 1)
                              navigateTo(context, JuniorSuite(index));
                            else if (index == 2)
                              navigateTo(context, ClassicRoom(index));
                            else if (index == 3)
                              navigateTo(context, DoubleRoom(index));
                            else if (index == 4)
                              navigateTo(context, FamilyRoom(index));
                            else if (index == 5)
                              navigateTo(context, ClassicRoom(index));
                          },
                          data: HotelCubit.get(context).features[index],
                        ),
                      );
                    },
                    itemCount: features.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ConditionalBuilder(
                        condition: true,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => ItemBookingRoom(
                          onTapFavorite: () {
                            HotelCubit.get(context).ChangisFavorited(index);
                            print(
                                '(((((((((${features[index]["is_favorited"]})))))))');
                          },
                          // width:570,
                          // height:287,
                          onTap: () {
                            if (index == 0)
                              navigateTo(context, SingleRoom(index));
                            else if (index == 1)
                              navigateTo(context, JuniorSuite(index));
                            else if (index == 2)
                              navigateTo(context, ClassicRoom(index));
                            else if (index == 3)
                              navigateTo(context, DoubleRoom(index));
                            else if (index == 4)
                              navigateTo(context, FamilyRoom(index));
                            else if (index == 5)
                              navigateTo(context, ClassicRoom(index));
                          },
                          data: HotelCubit.get(context).features[index],
                        ),
                      );
                    },
                    itemCount: features.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ConditionalBuilder(
                        condition: true,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => ItemBookingRoom(
                          onTapFavorite: () {
                            HotelCubit.get(context).ChangisFavorited(index);
                            print(
                                '(((((((((${features[index]["is_favorited"]})))))))');
                          },
                          // width:570,
                          // height:287,
                          onTap: () {
                            if (index == 0)
                              navigateTo(context, SingleRoom(index));
                            else if (index == 1)
                              navigateTo(context, JuniorSuite(index));
                            else if (index == 2)
                              navigateTo(context, ClassicRoom(index));
                            else if (index == 3)
                              navigateTo(context, DoubleRoom(index));
                            else if (index == 4)
                              navigateTo(context, FamilyRoom(index));
                            else if (index == 5)
                              navigateTo(context, ClassicRoom(index));
                          },
                          data: HotelCubit.get(context).features[index],
                        ),
                      );
                    },
                    itemCount: features.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ConditionalBuilder(
                        condition: true,
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                        builder: (context) => ItemBookingRoom(
                          onTapFavorite: () {
                            HotelCubit.get(context).ChangisFavorited(index);
                            print(
                                '(((((((((${features[index]["is_favorited"]})))))))');
                          },
                          // width:570,
                          // height:287,
                          onTap: () {
                            if (index == 0)
                              navigateTo(context, SingleRoom(index));
                            else if (index == 1)
                              navigateTo(context, JuniorSuite(index));
                            else if (index == 2)
                              navigateTo(context, ClassicRoom(index));
                            else if (index == 3)
                              navigateTo(context, DoubleRoom(index));
                            else if (index == 4)
                              navigateTo(context, FamilyRoom(index));
                            else if (index == 5)
                              navigateTo(context, ClassicRoom(index));
                          },
                          data: HotelCubit.get(context).features[index],
                        ),
                      );
                    },
                    itemCount: features.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 10.h,
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }
}

class CircleDevidor extends Decoration {
  CircleDevidor({required this.color, required this.redus});
  final Color color;
  double redus;
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CircleDevidor(color: color, redus: redus);
  }
}

class _CircleDevidor extends BoxPainter {
  _CircleDevidor({required this.color, required this.redus});
  final Color color;
  double redus;
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _pant = Paint();
    _pant.color = color;
    _pant.isAntiAlias = true;
    final Offset circleOffset =
        Offset(configuration.size!.width / 3.5, configuration.size!.height);
    final Offset circleOffset1 =
        Offset(configuration.size!.width / 1.4, configuration.size!.height);
    canvas.drawLine(offset + circleOffset, offset + circleOffset1, _pant);
  }
}
