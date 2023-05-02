import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/city_item.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/data.dart';
import '../../modules/widget/round_corners_button_widget.dart';
import '../../ui/appTheme.dart';
import 'Item_Hall.dart';


class ConventionHallScreen extends StatelessWidget {
  const ConventionHallScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HotelCubit,HotelStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  DefaultTabController(
          length: 4,//TypeHall.length,
          child: Container(
              child: Scaffold(
                appBar: AppBar(
                bottom:  TabBar(
                  //  indicatorColor: AppTheme.newLightTheme().primaryColor,
                    labelColor: AppTheme.newLightTheme().primaryColor,
                    unselectedLabelColor:HotelCubit.get(context).isDark ?AppTheme.newLightTheme().backgroundColor:AppTheme.newDarkTheme().backgroundColor ,
                    indicatorColor:Color(0xFFFfFfFf),
                    isScrollable: true,
                      indicator:CircleDevidor(color:AppTheme.newLightTheme().primaryColor ,
                      redus:9)  ,
                    padding: const EdgeInsetsDirectional.all(1),
                    physics:ScrollPhysics() ,
                    tabs:
                    [
                      CityItem(
                        isSelected: true,
                        data:categories[0],//TypeHall[0],
                        onTap: () {},
                      ),
                      CityItem(
                        isSelected: true,
                        data:categories[1],//TypeHall[1],
                        onTap: () {},
                      ),
                      CityItem(
                        isSelected: true,
                        data:categories[2],//TypeHall[0],
                        onTap: () {},
                      ),
                      CityItem(
                        isSelected: true,
                        data:categories[3],//TypeHall[1],
                        onTap: () {},
                      ),
                    ]
                ),
                ),
                body:Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: TabBarView(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        // crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.h,
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder:(context, index) {
                                return ConditionalBuilder(
                                  condition: true,
                                  fallback:(context)=> Center(child: CircularProgressIndicator()),
                                  builder:(context) => Padding(
                                    padding: const EdgeInsetsDirectional.only(start: 10,end: 10),
                                    child: ItemBookingHall(
                                      onTapFavorite: () {
                                       HotelCubit.get(context).ChangisFavorited(index);
                                             },
                                      // width:570,
                                      // height:287,
                                      onTap: (){},
                                      data: HotelCubit.get(context).Hall [index],
                                    ),
                                  ),
                                );},
                              itemCount:HotelCubit.get(context).Hall.length,
                               separatorBuilder: (context, index) {return SizedBox(height: 10,);}

                            ),
                          ),

                        ],
                      ),
                      Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 10,end: 10),
                            child: ItemBookingHall(
                              onTap: (){},
                              data:parking[0],
                              onTapFavorite: () {},
                            ),
                          ),
                        ],
                      ),
                      Column(
                        // crossAxisAlignment:CrossAxisAlignment.start,

                        children: [

                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 10,end: 10),
                            child: ItemBookingHall(

                              onTap: (){},
                              data:parking[0],
                              onTapFavorite: () {  },
                            ),
                          ),

                        ],
                      ),
                      Column(
                        // crossAxisAlignment:CrossAxisAlignment.start,

                        children: [

                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 10,end: 10),
                            child: ItemBookingHall(

                              onTap: (){},
                              data:parking[0],
                              onTapFavorite: () {  },
                            ),
                          ),

                          RoundCornerButtonWidget(
                            Padding_Containar: EdgeInsets.only( bottom: 10,left: 50,right: 50,top: 10),
                            key: Key('txt_get_started'),
                            title: 'Booking now',

                            // onTap: () => navigateTo(context, IntroductionPage()),
                            padding:const EdgeInsets.only(left: 48, right: 48, bottom: 8, top: 8) ,
                            bgColor: AppTheme.getTheme().primaryColor ,
                            textColor:Colors.white ,


                          ),
                        ],
                      ),

                    ],
                  ),
                )
              )
          ),
        );
      },

    );

  }
  getHall(context) {
    return SingleChildScrollView(
      padding: EdgeInsetsDirectional.only(top: 5,end: 15,start: 15,bottom:5 ),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          cities.length, (index) => Padding(
          padding: const EdgeInsets.only(right: 8),
          child: CityItem(
            isSelected: true,
            data:categories[index],
            onTap: () {},
          ),
        ),
        ),
      ),
    );
  }



}
class CircleDevidor extends Decoration{

  CircleDevidor( {required  this.color,required this.redus });
  final Color  color;
  double redus;
  @override
  BoxPainter createBoxPainter([VoidCallback ? onChanged]) {
    // TODO: implement createBoxPainter
    return _CircleDevidor(color: color, redus: redus);
  }
}
class _CircleDevidor extends BoxPainter {
  _CircleDevidor( {required  this.color,required this.redus });
  final Color  color;
  double redus;
  @override
  void paint(Canvas canvas,
      Offset offset, ImageConfiguration configuration)
  {
    Paint _pant=Paint();
    _pant.color=color;
    _pant.isAntiAlias=true;
    final Offset circleOffset =Offset(configuration.size!.width/3.5,configuration.size!.height);
    final Offset circleOffset1 =Offset(configuration.size!.width/1.4,configuration.size!.height);
    canvas.drawLine( offset+circleOffset,offset+circleOffset1, _pant);
  }


}
