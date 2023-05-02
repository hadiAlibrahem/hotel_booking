import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hotel_booking/layout/dashboard_page.dart';
import 'package:hotel_booking/modules/login/login_page.dart';
import 'package:hotel_booking/modules/widget/round_corner_text_input_widget.dart';
import 'package:hotel_booking/modules/widget/round_corners_button_widget.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/color_helper.dart';
import 'package:hotel_booking/authentication/domain/entities/signup_entity.dart';
import 'package:hotel_booking/modules/login/login_page.dart';
import 'package:hotel_booking/modules/signup/cubit/cubit.dart';
import 'package:hotel_booking/modules/signup/cubit/states.dart';
import 'package:hotel_booking/modules/widget/round_corner_text_input_widget.dart';
import 'package:hotel_booking/modules/widget/round_corners_button_widget.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/color_helper.dart';
import '../../../main.dart';

import '../../layout/hotel_layout_screen.dart';
import '../../shared/compoment/costanse.dart';
import '../../shared/network/local/cash_helper.dart';
import '../login/cubit/cubit.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
var formKey=GlobalKey<FormState>();
var nameController = TextEditingController();
var emailController = TextEditingController();
var passwordController = TextEditingController();
var phoneController = TextEditingController();
class SignUpPage extends StatelessWidget{

  String _signUpStatus = '';
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HotelRegisterCubit(),
      child:BlocConsumer<HotelRegisterCubit,HotelRegisterStates>(
        listener: (context, state) {
          if(state is HotelRegisterSuccessState){
            if(state.loginModel.status==true)
            {
              _signUpStatus=state.loginModel.message.toString();
              //  print(state.loginModel.message);
              // print(state.loginModel.data?.token);
              showToast(text: '${state.loginModel.message}',
                  state:ToastState.SUCCES,
                );
              CacheHelper.saveData(key: 'token', value: state.loginModel.data?.token).then((value)
              {
                token=state.loginModel.data!.token!;
                navigateTo(context, HotelLayout(),);
              }
              );
            }else
            {
              _signUpStatus=state.loginModel.message.toString();
              print(state.loginModel.message);
              showToast(text: '${state.loginModel.message}',
                 state:ToastState.ERROR,
               );
            }
          }
        },
        builder: (context, state) {
          return  Scaffold(
            appBar:  AppBar(),
            //backgroundColor: AppTheme.getTheme().backgroundColor,
            body: InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              onTap: () {
             //   FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Padding(
                      //padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        ' Sign Up',
                        style:  TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: Padding(
                                padding: EdgeInsets.only(top: 32.h),
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 24.w,
                                    ),
                                    Expanded(
                                      child: getFTButton(),
                                    ),
                                    SizedBox(
                                      width: 16.w,
                                    ),
                                    Expanded(
                                      child: getFTButton(isFacebook: false),
                                    ),
                                    SizedBox(
                                      width: 24.w,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                ' Sign up With Email',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppTheme.getTheme().disabledColor,
                                 // color:AppCubit.get(context).isDark ? AppTheme.getTheme().disabledColor:AppTheme.getTheme().primaryColor,
                                ),
                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                  left: 24.w, right: 24.w, bottom: 16.h),
                              child: RoundCornerTextInputWidget(

                                controler: nameController,
                               onSubmit: (){},

                                prefix:Icon(Icons.person_add_rounded) ,
                                keyboardType: TextInputType.text,
                                inputTextKey: Key('txt_first_name'),
                                hintText:'Your Name',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, right: 24.w, bottom: 16.h),
                              child: RoundCornerTextInputWidget(

                                prefix: Icon(Icons.phone),

                                onSubmit: (){},
                                controler:phoneController,
                                keyboardType: TextInputType.phone,
                                inputTextKey: Key('phone'),
                                hintText: 'Your Phone',

                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left:24.w, right: 24.w),

                              child: RoundCornerTextInputWidget(

                                onSubmit: () {},
                                controler: emailController,
                                keyboardType: TextInputType.emailAddress,
                                inputTextKey: Key('txt_email'),
                                hintText: 'your Email',
                                prefix:Icon( Icons.email),


                              ),
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                  left: 24.w, right: 24.w, top: 16.h),
                              child: RoundCornerTextInputWidget(
                               obscurePassword:HotelRegisterCubit.get(context).isPassword,
                                onSubmit: (){},
                               controler: passwordController,
                                keyboardType:TextInputType.visiblePassword,
                                inputTextKey: Key('txt_password'),
                                hintText: 'password',
                                prefix:Icon(Icons.lock) ,
                                suffix: IconButton(icon: HotelRegisterCubit.get(context).suffix,onPressed: () {
                                  HotelRegisterCubit.get(context).changPasswordVisibility();
                                },),
                              ),

                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 24.w, right: 24.w, bottom: 8.h, top: 24.h),
                              child: ConditionalBuilder(
                                condition:state is! HotelRegisterLoadingState,
                                builder: (context) => RoundCornerButtonWidget(

                                  buttonKey: Key('btn_signup'),
                                  title: 'Sign Up',
                                  bgColor: ColorHelper.primaryColor,
                                  onTap: () {
                                    if(
                                    HotelRegisterCubit.get(context).RegisterValidator(
                                      email:  emailController.text,
                                      password: passwordController.text,
                                      name:  nameController.text,
                                      phone:phoneController.text,)==''
                                    )
                                    {

                                      HotelRegisterCubit.get(context).userRegister(
                                        firstname:  nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone:phoneController.text,
                                      );
                                    }
                                    else{

                                      _signUpStatus=HotelRegisterCubit.get(context).RegisterValidator(
                                        name:  nameController.text,
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone:phoneController.text,);
                                    }
                                  },
                                ),
                                fallback:(context)=> Center(child: CircularProgressIndicator()),
                              ),




                            ),
                             SizedBox(
                               height: 20.h,
                             ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                _signUpStatus.toString(),
                                key: Key('txt_error'),
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'Already Have Account',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme.getTheme().disabledColor,
                                  ),
                                ),
                                InkWell(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  onTap: () {
                                    navigateTo(
                                        context,LoginPage()
                                    );

                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.getTheme().primaryColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).padding.bottom + 24,
                            )
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

      )
    );
  }

  Widget getFTButton({bool isFacebook: true}) {
    return isFacebook
        ? RoundCornerButtonWidget(
            title: 'facebook',
            bgColor: ColorHelper.facebookColor,
            prefixIcon:
                Icon(FontAwesomeIcons.facebookF, size: 20, color: Colors.white),
          )
        : RoundCornerButtonWidget(
            title: 'twitter',
            bgColor: ColorHelper.twitterColor,
            prefixIcon:
                Icon(FontAwesomeIcons.twitter, size: 20, color: Colors.white),
          );
  }

}
