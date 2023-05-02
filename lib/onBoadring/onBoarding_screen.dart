// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, non_constant_identifier_names, override_on_non_overriding_member, unused_element

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/modules/login/login_page.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/shared/network/local/cash_helper.dart';
import 'package:hotel_booking/shared/style/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String? image;
  final String? titel;
  final String? body;

  BoardingModel({
    required this.image,
    required this.titel,
    required this.body,
  });
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var BoardController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
      image:
          'https://www.readersdigest.ca/wp-content/uploads/2021/12/shopping-apps-how-to-save-money-on-groceries-in-canada.jpg?w=1200',
      titel: 'On Board 1 titel',
      body: 'On Board 1 body',
    ),
    BoardingModel(
      image:
          'https://www.readersdigest.ca/wp-content/uploads/2021/12/shopping-apps-how-to-save-money-on-groceries-in-canada.jpg?w=1200',
      titel: 'On Board 2 titel',
      body: 'On Board 2 body',
    ),
    BoardingModel(
      image:
          'https://www.readersdigest.ca/wp-content/uploads/2021/12/shopping-apps-how-to-save-money-on-groceries-in-canada.jpg?w=1200',
      titel: 'On Board 3 titel',
      body: 'On Board 3 body',
    ),
  ];

  bool isLast = false;
  void submit() {
    CacheHelper.saveData(key: 'OnBoarding', value: true).then((value){
      if (value){
      navigateAndFinish(
          context,
        LoginPage(),
      );
      }
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: submit,
      child: Text(
              'SKIP',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
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
                    BuildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: BoardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5.0,
                    expansionFactor: 4,
                    activeDotColor: defaultColor,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast == true) {
                      submit();
                    } else {
                      BoardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget BuildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: NetworkImage('${model.image}'),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            '${model.titel}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '${model.body}',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
}
