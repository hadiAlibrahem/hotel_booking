// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/modules/home/home_screen.dart';
import 'package:hotel_booking/shared/bloc_observer.dart';
import 'package:hotel_booking/shared/compoment/costanse.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'layout/hotel_cubit/cubite.dart';
import 'layout/hotel_cubit/states.dart';
import 'layout/hotel_layout_screen.dart';
import 'modules/booking_room/double_room.dart';
import 'modules/booking_room/junior_suite.dart';
import 'modules/booking_room/single_room.dart';
import 'modules/login/login_page.dart';

import 'modules/password_recovery/presentation/pages/forgot_password_page.dart';
import 'onBoadring/onBoarding_screen.dart';
import 'onBoadring/presentation/pages/introduction_screen.dart';
import 'onBoadring/presentation/pages/splash_screen.dart';
import 'shared/network/local/cash_helper.dart';
import 'shared/network/remot/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget  widget;
  bool ?isDark = CacheHelper.getData(key: 'isDark');
  bool ? onBoarding =CacheHelper.getData(key: 'OnBoarding');
  token =CacheHelper.getData(key: 'token')??"";
  print(token);
if(onBoarding!=null)
{
  if(token!=null) widget =HotelLayout();
  else widget =LoginPage();
}else{
  widget =OnBoardingScreen();
}
  var shared = await SharedPreferences.getInstance();

  runApp(MyApp(
      isDark:isDark,
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final bool ?isDark;
  final Widget? startWidget;
  MyApp({
    this.isDark,
 this.startWidget,
});
  // static setCustomeTheme(BuildContext context) {
  //   final MyAppState state = context.findAncestorStateOfType<MyAppState>()!;
  //   state.setCustomeTheme();
  // }
  // MyAppState createState() => MyAppState();
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
         create: (BuildContext context)=>HotelCubit()..getUserData(),//..getCategories()..getFavorites()
        ),
        // BlocProvider(
        //  create: (BuildContext context)=>AppCubit()..changAppMode(fromShared: isDark),
        // ),
      ],
      child:
      BlocConsumer<HotelCubit, HotelStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context , child) {
              return MaterialApp(
                navigatorKey: navigatorKey,
                debugShowCheckedModeBanner: false,
                theme: AppTheme.newLightTheme(),
                darkTheme: AppTheme.newDarkTheme(),
                themeMode: HotelCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
                 
                 home: HotelLayout(),
               // IntroductionPage(),
              );
            }
          );
        },
      ),
    );


  }
}
