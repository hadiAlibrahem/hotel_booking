import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:hotel_booking/app/validators/login_validator.dart';
import 'package:hotel_booking/authentication/domain/entities/login_entity.dart';
import 'package:hotel_booking/layout/dashboard_page.dart';
import 'package:hotel_booking/layout/hotel_layout_screen.dart';
import 'package:hotel_booking/modules/login/cubit/cubit.dart';
import 'package:hotel_booking/modules/login/cubit/states.dart';
import 'package:hotel_booking/modules/password_recovery/presentation/pages/forgot_password_page.dart';
import 'package:hotel_booking/modules/signup/signup_page.dart';
import 'package:hotel_booking/modules/widget/round_corner_text_input_widget.dart';
import 'package:hotel_booking/modules/widget/round_corners_button_widget.dart';
import 'package:hotel_booking/onBoadring/presentation/pages/introduction_screen.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/shared/compoment/costanse.dart';
import 'package:hotel_booking/shared/network/local/cash_helper.dart';
import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/color_helper.dart';
import '../../../main.dart';

class LoginPage extends StatelessWidget {
  @override
  late LoginEntity _loginEntity;
  String _loginStatus = '';
  LoginEntity loginEntity = LoginEntity();

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) => HotelLoginCubit(),
      child: BlocConsumer<HotelLoginCubit, HotelLoginStates>(
        listener: (context, state) {
          if (state is HotelLoginSuccessState) {
            if (state.loginModel.status == true) {
              _loginStatus=state.loginModel.message.toString();
              print(state.loginModel.message);

               showToast(text: '${state.loginModel.message}',
              state:ToastState.SUCCES,
                );
              CacheHelper.saveData(
                  key: 'token', value: state.loginModel.data!.token).then((value)
              {
                token = state.loginModel.data!.token!;
                navigateTo(context, HotelLayout());
              }
              );

            } else
               {
                 _loginStatus=state.loginModel.message.toString();
                 print(state.loginModel.message);
                 showToast(text: '${state.loginModel.message}',
                  state:ToastState.ERROR,
                 );
               }
             }

          },

        builder: (context, state) {
          return Container(
            child: Scaffold(
              appBar: AppBar(),
            //  backgroundColor: AppTheme.getTheme().scaffoldBackgroundColor,
              body: InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                focusColor: Colors.transparent,
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        //padding: const EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                        child: Text(
                          ' LogIn',
                          style: new TextStyle(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 24.w,
                                    ),
                                    Expanded(
                                      child: getFTButton(),
                                    ),
                                    SizedBox(
                                      width: 24.w,
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
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  'or LogIn With Email',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppTheme
                                        .getTheme()
                                        .disabledColor,
                                  ),
                                ),
                              ),
                               SizedBox(
                                height: 15.h,
                               ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 24, right: 24),
                                child: RoundCornerTextInputWidget(
                                  onSubmit: (){},
                                  controler: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  inputTextKey: Key('txt_email'),
                                  hintText: 'yourEmail',
                                  prefix: Icon(Icons.email),

                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(
                                    left: 24.w, right: 24.w, top: 16.h),
                                child: RoundCornerTextInputWidget(
                                  obscurePassword:HotelLoginCubit.get(context).isPassword,
                                  onSubmit: () {},
                                  controler:passwordController ,
                                  keyboardType: TextInputType.visiblePassword,
                                  inputTextKey: Key('txt_password'),
                                  hintText: 'password',
                                  prefix: Icon(Icons.lock),
                                  suffix: IconButton(icon: HotelLoginCubit.get(context).suffix,onPressed: () {
                                    HotelLoginCubit.get(context).changPasswordVisibility();
                                  },
                                  ),
                                ),

                              ),
                               SizedBox(
                                height: 10.h,
                               ),
                              Padding(
                                padding:
                                const EdgeInsets.only(
                                    top: 8, right: 16, bottom: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    InkWell(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                      onTap: () {
                                        navigateTo(context,ForgotPasswordPage());
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'forget Your Password',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500,
                                            color: AppTheme.getTheme()
                                                .disabledColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Padding(

                                padding: const EdgeInsets.only(
                                    left: 24, right: 24, bottom: 8, top: 8),
                                child:ConditionalBuilder(
                                  condition:state is! HotelLoginLoadingState,
                                  builder: (context)=>RoundCornerButtonWidget(
                                    buttonKey: Key('btn_login'),
                                    title: 'login',
                                    bgColor: ColorHelper.primaryColor,
                                    onTap: () {
                                      if(
                                      HotelLoginCubit.get(context).LoginValidator(
                                          email: emailController.text,
                                          password:passwordController.text)==''
                                      )
                                      {
                                        HotelLoginCubit.get(context).userLogin(
                                          email: emailController.text,
                                          password: passwordController.text,);
                                      }
                                      else{

                                        _loginStatus=HotelLoginCubit.get(context).LoginValidator(
                                          email:  emailController.text,
                                          password: passwordController.text,);
                                      }



                                    },
                                  ),
                                  fallback:(context)=> Center(child: CircularProgressIndicator()),

                              ),
                              ),
                               SizedBox(
                                 height: 20.0.h,
                               ),


                               //if( _loginStatus.toString() !=null)

                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(
                                      _loginStatus.toString(),
                                      key: Key('txt_error'),
                                      style: TextStyle(
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),


                              // showToast(text:_loginStatus.toString(),//'${value}',
                              //  state:ToastState.ERROR,)  ,

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },

      ),
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

  Widget appBar() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        // SizedBox(
        //   height: AppBar().preferredSize.height,
        //   child: Padding(
        //     padding: EdgeInsets.only(top: 8, left: 8),
        //     child: Container(
        //       color: Colors.blue,
        //       width: AppBar().preferredSize.height-20 ,
        //       height: AppBar().preferredSize.height -20,
        //       child: InkWell(
        //
        //         borderRadius: BorderRadius.all(
        //           Radius.circular(32.0),
        //         ),
        //         onTap: () {
        //           Navigator.pop(context);
        //         },
        //         child: Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Icon(Icons.arrow_back),
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 4, left: 24),
          child: Text(
            ' logIn',
            style: new TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

}