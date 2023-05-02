// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/models/login_model.dart';
import 'package:hotel_booking/modules/signup/cubit/states.dart';
import 'package:hotel_booking/shared/network/end_points.dart';
import 'package:hotel_booking/shared/network/remot/dio_helper.dart';

class HotelRegisterCubit extends Cubit<HotelRegisterStates>{

  HotelRegisterCubit() : super(HotelRegisterInitialState());

  static HotelRegisterCubit get(context)=>BlocProvider.of(context);
  HotelLoginModel ?loginModel;

  void userRegister({
  required String firstname,
  required String email,
  required String password,
 // required String lastname,
  required String phone,
})
  {
    emit(HotelRegisterLoadingState());
  DioHelper.postData(
      url: REGISTER,
      data: {
        'name':firstname,
        'email':email,
        'password':password,
        'phone':phone,
      },
  ).then((value)
  {
    loginModel=HotelLoginModel.formJson(value?.data);
//   print(loginModel?.status);
//   print(loginModel?.message);
//   print(loginModel?.data?.token);
    emit(HotelRegisterSuccessState(loginModel!));
  }).catchError((error)
  {
    print(error.toString());
    emit(HotelRegisterErrorState(error.toString()));
  });
  }

  Icon suffix=Icon(Icons.visibility_outlined);
  bool isPassword=true;
  void changPasswordVisibility()
  {
    isPassword=!isPassword;
    suffix =isPassword ?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined);
    emit(HotelRegisterChangPasswordVisibilityState());
  }

  String RegisterValidator( {
    String? email,
    String? password,
    String ? phone,
    String ? name,
  })

  {
    String value = '';
    if ((name ?? '').isEmpty) {
      value =' Please Enter Your Name';
      emit(HotelRegisterErrorStateInName(value));
    }
    else if ((phone ?? '').isEmpty) {
      value =' Please Enter Your Phone';
      emit(HotelRegisterErrorStateInPhone(value));
    }

    else if (!RegExp(
        r"^[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]+[0-9]")
        .hasMatch(phone!))
    {
      value ='Please Enter Valid Phone';
      emit(HotelRegisterErrorStateInValidPhone(value));
    }

    else if ((email ?? '').isEmpty) {
      value =' Please Enter Email';
      emit(HotelLoginErrorStateInEmail(value));
    }
    else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email!))
    {
      value ='Please Enter Valid Email';
      emit(HotelRegisterErrorStateInValidEmail(value));
    }

    else if ((password ?? '').isEmpty) {
      value ='Please Enter Password';
      emit(HotelRegisterErrorStateInPassword(value));

    }

    else if (password!.length < 6 || password.length > 20) {
      value ='Password must be Within 6 And 20 Characters';
      emit(HotelRegisterErrorStateInTOShortPassword(value));
    }
    return value;
  }

}