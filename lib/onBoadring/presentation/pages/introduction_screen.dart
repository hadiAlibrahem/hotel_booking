import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/modules/login/login_page.dart';
import 'package:hotel_booking/modules/signup/signup_page.dart';
import 'package:hotel_booking/modules/widget/entity/slider_entity.dart';
import 'package:hotel_booking/modules/widget/round_corners_button_widget.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/color_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../main.dart';


class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  var pageController = PageController(initialPage: 0);
  var pageViewModelData = [];

  Timer? sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    pageViewModelData.addAll(SliderData.introSliderData);

    sliderTimer = Timer.periodic(Duration(seconds: 4), (timer) {
      if (currentShowIndex == 0) {
        pageController.animateTo(MediaQuery.of(context).size.width,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 1) {
        pageController.animateTo(MediaQuery.of(context).size.width * 2,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      } else if (currentShowIndex == 2) {
        pageController.animateTo(0,
            duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    sliderTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Scaffold(
      //  backgroundColor: Color(0xFFF6F6F6),//AppTheme.getTheme().backgroundColor,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).padding.top,
            ),
            Expanded(

              child: PageView(


                controller: pageController,
                pageSnapping: true,
                onPageChanged: (index) {
                  currentShowIndex = index;
                },
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  PagePopup(imageData: pageViewModelData[0]),
                  PagePopup(imageData: pageViewModelData[1]),
                  PagePopup(imageData: pageViewModelData[2]),
                ],
              ),
            ),
            SmoothPageIndicator(
              count: 3,
              effect: WormEffect(
                  radius: 10.0,
                  spacing: 5.0,
                  dotColor: AppTheme.getTheme().dividerColor,
                  activeDotColor: AppTheme.getTheme().primaryColor),
              controller: pageController,
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: 48.w, right: 48.w, bottom: 8.h, top: 32.h),
                child: RoundCornerButtonWidget(
                  buttonKey: Key('btn_login'),
                  bgColor: ColorHelper.primaryColor,
                  title: 'login',
                  onTap: () {
                    navigateTo(context, LoginPage());
                  },
                )),
            Padding(
                padding:  EdgeInsets.only(
                    left: 48.w, right: 48.w, bottom: 32.h, top: 8.h),
                child: RoundCornerButtonWidget(
                  buttonKey: Key('btn_create_acc'),
                  bgColor: ColorHelper.primaryColor,
                  onTap: () {
                    navigateTo(
                      context, SignUpPage(),
                    );
                  },
                  title: 'Craet Acount',


                )),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }
}

class PagePopup extends StatelessWidget {
  final SliderData? imageData;

  const PagePopup({Key? key, this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 8,
          child: Center(
            child: Container(


           //   color: Colors.white,
           //   color: Color.fromARGB(255, 255, 255, 255),
             width: MediaQuery.of(context).size.width - 120,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  imageData!.assetsImage!,
                  fit: BoxFit.cover,

                  //colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
                 // color: Color.fromARGB(255, 255, 255, 255),
                 //   color : Colors.white.withOpacity(0.0)
                  //color:AppTheme.getTheme().scaffoldBackgroundColor,
                  //colorBlendMode: BlendMode.clear,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              imageData!.titleText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            child: Text(
              imageData!.subText!,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppTheme.getTheme().disabledColor,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}
