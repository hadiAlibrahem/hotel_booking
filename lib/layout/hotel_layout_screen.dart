
// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/modules/profile/presentation/pages/profile_page.dart';
import 'package:hotel_booking/modules/widget/selectable_title_widget.dart';
//import 'package:shop_app/modules/search/search_Screen.dart';

import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/shared/network/local/cash_helper.dart';
import 'package:hotel_booking/ui/appTheme.dart';

import 'animationrout.dart';

class HotelLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<HotelCubit,HotelStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = HotelCubit.get(context);
        return Scaffold(
          backgroundColor: HotelCubit.get(context).isDark?AppTheme.newDarkTheme().scaffoldBackgroundColor:AppTheme.newLightTheme().scaffoldBackgroundColor,
          appBar: AppBar(
            actions: [
              IconButton(onPressed: (){
                Navigator.of(context).push(SlideRight(page: ProfilePage() ));
                // navigateTo(context, ProfilePage());
              },
                  icon: Icon(
                    Icons.menu,
                  ),
              ),
            ],
          ),
          body:cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index)
            {
              cubit.chanBottom(index);
            },
            currentIndex: cubit.currentIndex,
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',

              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.bookOpen),
                label: 'mybooking',

              ),
              BottomNavigationBarItem(
                icon:Icon(Icons.favorite),
                label: 'favorites',

              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',

              ),
            ],
          ),
        );
      },

    );
  }
}
