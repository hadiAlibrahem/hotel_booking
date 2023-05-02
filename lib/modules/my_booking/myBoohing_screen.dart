import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyBookingScreen extends StatelessWidget {
  const MyBookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Center(
            child: Text(
              'MyBooking Screen',
            ),
          ),
        ],
      ),
    );
  }
}
