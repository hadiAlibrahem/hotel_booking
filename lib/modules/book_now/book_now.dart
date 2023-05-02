import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/modules/book_now/room_range_selection_widget.dart';
import 'package:hotel_booking/modules/my_booking/myBoohing_screen.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/text_styles.dart';
import 'package:intl/intl.dart';

import 'calendar_popup_widget.dart';
import 'custom_calendar_widget.dart';

class BookNowScreen extends StatefulWidget {
  const BookNowScreen({Key? key}) : super(key: key);

  @override
  _BookNowScreenState createState() => _BookNowScreenState();
}

class _BookNowScreenState extends State<BookNowScreen> {
  @override
  int room = 1;
  int ad = 2;
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now().add(Duration(days: 5));
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Now',

        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            getTimeDateUI(),
            SizedBox(
              height: 25.h,
            ),
            Text(
              'Are you shore for your data?',
              style:TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding:  EdgeInsets.only(
                  left: 30.w, right: 30.w, bottom: 16.h, top: 8.h),
              child: Container(
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppTheme.getTheme().primaryColor,
                  borderRadius:
                  BorderRadius.all(Radius.circular(24.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: AppTheme.getTheme().dividerColor,
                      blurRadius: 8,
                      offset: Offset(4, 4),
                    ),
                  ],
                ),
                child: InkWell(
                  borderRadius:
                  BorderRadius.all(Radius.circular(24.0)),
                  highlightColor: Colors.transparent,
                  onTap: () {
                    navigateTo(context, MyBookingScreen());
                    // try {
                    //   // animationController.reverse().then((f) {
                    //
                    //   // });
                    //   widget.onApplyClick!(
                    //       startDate, endDate);
                    //   Navigator.pop(context);
                    // } catch (e) {}
                  },
                  child: Center(
                    child: Text(
                      'apply',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            //CustomCalendarWidget(),
           //SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
  Widget getTimeDateUI() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'click to choose date of book :',
            style:TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding:  EdgeInsets.only(
              left:MediaQuery.of(context).size.width/10,
              right: MediaQuery.of(context).size.width/10,
            ),
            child: Container(
              width: 250.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color:Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),

                ),
              ),
              child: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.grey.withOpacity(0.2),

                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  // setState(() {
                  //   isDatePopupOpen = true;
                  // });
                  showDemoDialog(context: context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'choose Date',
                      style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                          color: Colors.grey.withOpacity(0.8)),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "${DateFormat("dd, MMM").format(startDate)} - ${DateFormat("dd, MMM").format(endDate)}",
                      style: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          myDiveder(),
          SizedBox(
            height: 20.h,
          ),
          Text(
              'click to choose number of rooms :',
            style:TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Padding(
            padding:  EdgeInsets.only(
              left:MediaQuery.of(context).size.width/10,
              right: MediaQuery.of(context).size.width/10,
            ),
            child: Container(
              width: 250.w,
              height: 100.h,
              decoration: BoxDecoration(
                color:Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),

                ),
              ),
              child: InkWell(
                focusColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,

                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        RoomRangeSelectionWidget(
                          ad: 2,
                          room: 1,
                          ch: 0,
                          barrierDismissible: true,
                          onChnage: (ro, a, c) {
                            setState(() {
                              room = ro;
                              ad = a;
                            });
                          },
                        ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8, right: 8, top: 4, bottom: 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'number Of Rooms',
                        style: TextStyle(
                            fontWeight: FontWeight.w100,
                            fontSize: 16,
                            color: Colors.grey.withOpacity(0.8)),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        "$room Room - $ad Adults",
                        style: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void showDemoDialog({required BuildContext context}) {
    showDialog(
      context: context,
      builder: (BuildContext context) => CalendarPopupWidget(
        barrierDismissible: true,
        minimumDate: DateTime.now(),
        //  maximumDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day + 10),
        initialEndDate: endDate,
        initialStartDate: startDate,
        onApplyClick: (DateTime? startData, DateTime? endData) {
          setState(() {
            if (startData != null && endData != null) {
              startDate = startData;
              endDate = endData;
            }
          });
        },
        onCancelClick: () {},
      ),
    );
  }
}
