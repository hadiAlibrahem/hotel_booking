

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/modules/login/cubit/cubit.dart';
import 'package:hotel_booking/modules/login/cubit/states.dart';
import 'package:hotel_booking/modules/widget/round_corner_text_input_widget.dart';
import 'package:hotel_booking/modules/widget/round_corners_button_widget.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/color_helper.dart';

class ChangePasswordPage extends StatelessWidget {

    var passwordController = TextEditingController();
    var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {

        return BlocProvider(

          create: (BuildContext context)=>HotelLoginCubit(),
          child: BlocConsumer<HotelLoginCubit,HotelLoginStates>(
            listener: (context,state){},
            builder: (context,state){
              return  Container(
                child: Scaffold(
                  // backgroundColor: AppTheme.getTheme().backgroundColor,
                  body: InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding:
                          EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                          child: appBar(context),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 16.0, bottom: 16.0, left: 24, right: 24),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        'enter Your NewPassword',
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppTheme.getTheme().disabledColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 24, right: 24),
                                  child: RoundCornerTextInputWidget(

                                    onSubmit: (){

                                    },
                                    controler:passwordController ,
                                    keyboardType: TextInputType.visiblePassword,
                                    inputTextKey: Key('txt_password_new'),
                                    hintText: 'New password',
                                    prefix: Icon(Icons.lock),
                                    suffix: IconButton(icon: HotelLoginCubit.get(context).suffix,onPressed: () {
                                      HotelLoginCubit.get(context).changPasswordVisibility();
                                    },),

                                    // onFieldSubmitted: (value)
                                    // {
                                    //   if(formKey.currentState!.validate())
                                    //   {
                                    //     HotelLoginCubit.get(context).userLogin(
                                    //       email: emailController.text,
                                    //       password: passwordController.text,
                                    //     );
                                    //   }
                                    // },


                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 24, right: 24),
                                  child: RoundCornerTextInputWidget(

                                    // validate: (value){
                                    //   if (value!.isEmpty) {
                                    //     return ('password is too short');
                                    //   }
                                    // },
                                    onSubmit: (){},
                                    controler:passwordController ,
                                    keyboardType: TextInputType.visiblePassword,
                                    inputTextKey: Key('txt_password_confg'),
                                    hintText: 'Configre Password',
                                    prefix: Icon(Icons.lock),
                                    suffix: IconButton(icon: HotelLoginCubit.get(context).suffix,onPressed: () {
                                      HotelLoginCubit.get(context).changPasswordVisibility();
                                    },),
                                    // validate: (value)
                                    // {
                                    //   // if (value!.isEmpty) {
                                    //   // return ('password is too short');
                                    //   // }
                                    // },
                                    // onFieldSubmitted: (value)
                                    // {
                                    //   if(formKey.currentState!.validate())
                                    //   {
                                    //     HotelLoginCubit.get(context).userLogin(
                                    //       email: emailController.text,
                                    //       password: passwordController.text,
                                    //     );
                                    //   }
                                    // },


                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 24, right: 24, bottom: 8, top: 16),
                                  child: RoundCornerButtonWidget(
                                    title: 'apply',
                                    bgColor: ColorHelper.primaryColor,
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },

          ),
        );

  }

  Widget appBar(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: AppBar().preferredSize.height,
          child: Padding(
            padding: EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 24),
          child: Text(
            'changePassword',
            style: new TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
