// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/models/login_model.dart';
import 'package:hotel_booking/modules/login/cubit/states.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/shared/compoment/costanse.dart';
import 'package:hotel_booking/shared/network/end_points.dart';
import 'package:hotel_booking/shared/network/remot/dio_helper.dart';

class HotelLoginCubit extends Cubit<HotelLoginStates>{

  HotelLoginCubit() : super(HotelLoginInitialState());

  static HotelLoginCubit get(context)=>BlocProvider.of(context);

  HotelLoginModel ?loginModel;
  void userLogin({
  required String email,
  required String password,
})
  {
    emit(HotelLoginLoadingState());
  DioHelper.postData(
      url: LOGIN,

      data: {
        'email':email,
        'password':password,
      },
  ).then((value)
  {

    loginModel=HotelLoginModel.formJson(value?.data);
//   print(loginModel?.status);
//   print(loginModel?.message);
//   print(loginModel?.data?.token);
    emit(HotelLoginSuccessState(loginModel!));
  }).catchError((error)
  {
    print(error.toString());
    emit(HotelLoginErrorState(error.toString()));
  });
  }


  Icon suffix=Icon(Icons.visibility_outlined);
  bool isPassword=true;
  void changPasswordVisibility()
  {
    isPassword=!isPassword;
    suffix =isPassword ?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined);
    emit(HotelChangPasswordVisibilityState());
  }

  String  LoginValidator( {
    String? email,
    String? password,
  })

  {
    String value = '';
    if ((email ?? '').isEmpty) {
      value =' Please Enter Email';
      emit(HotelLoginErrorStateInEmail(value));
    }
    else if ((password ?? '').isEmpty) {
      value ='Please Enter Password';
      emit(HotelLoginErrorStateInPassword(value));
    }
    else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!))
    {
      value ='Please Enter Valid Email';
      emit(HotelLoginErrorStateInValedEmail(value));
    } else if (password!.length < 6 || password.length > 20) {
      value ='password MustBe WithIn 6 And 20 Characters';
      emit(HotelLoginErrorStateInTOShortPassword(value));
    }
    return value;
    // (
    //     showToast(text: '${value}',
    //         state:ToastState.SUCCES,) ) as String  ;
  }


}
