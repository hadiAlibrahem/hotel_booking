
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/models/login_model.dart';
import 'package:hotel_booking/modules/settings/domain/entities/setting_entity.dart';
import 'package:hotel_booking/modules/signup/signup_page.dart';
import 'package:hotel_booking/modules/widget/round_corner_text_input_widget.dart';
import 'package:hotel_booking/modules/widget/round_corners_button_widget.dart';
import 'package:hotel_booking/shared/compoment/components.dart';

import 'package:hotel_booking/ui/appTheme.dart';
import 'package:hotel_booking/ui/color_helper.dart';
import 'package:image_picker/image_picker.dart';


class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() =>_EditProfilePageState();

}
class _EditProfilePageState extends State<EditProfilePage> {
   void initState() {
  //   widget.animationController!.forward();
     super.initState();
   }
  List<SettingEntity> userInfoList = SettingEntity.userInfoList;
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
   File ? image;
  final imagepicker= ImagePicker();
  uploadImage()async {
    var pickedImage = await imagepicker.getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });

    } else {}
  }






  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

        return  Container(
          child: BlocConsumer<HotelCubit,HotelStates>(
            listener: (context,state){},
            builder: (context,state){
              return Scaffold(
              //  backgroundColor: AppTheme.getTheme().backgroundColor,
                body: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                  child: Form(
                    key: formKey,
                    child: SingleChildScrollView(

                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            appBar(context),
                            getProfileUI(),
                            ConditionalBuilder(
                              condition:HotelCubit.get(context).userModel !=null ,
                              builder:(context){
                                return userBuilder(HotelCubit.get(context).userModel!,context,

                              );
                              } ,
                                fallback:(context) => Center(child: CircularProgressIndicator()),
                            ),

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

  Widget getProfileUI() {
    return Padding(
      padding:  EdgeInsets.only(bottom: 20.h,top:20.0.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 130.w,
            height: 130.h,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    color: AppTheme.getTheme().primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                        color: AppTheme.getTheme().dividerColor,
                        blurRadius: 8,
                        offset: Offset(4, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(60.0)),
                    child:Center(child: image==null?Text('not found image profile'):Image.file(image!)),
                  //  Image.asset("assets/images/userImage.png"),
                  ),
                ),
                Positioned(
                  bottom: 6.h,
                  right: 6.w,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.getTheme().primaryColor,
                      shape: BoxShape.circle,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: AppTheme.getTheme().dividerColor,
                          blurRadius: 8,
                          offset: Offset(4, 4),
                        ),
                      ],
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        onTap:uploadImage,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt,
                            color: AppTheme.getTheme().backgroundColor,
                            size: 18,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget appBar(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only( left: 8.w,top:40.h),
          child: Container(
            width: AppBar().preferredSize.height - 8,
            height: AppBar().preferredSize.height - 8,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(32.0),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: EdgeInsets.only(left:8.0.w),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding:  EdgeInsets.only(top: 4.h, left: 24.w,bottom: 10.h),
          child: Text(
          'editProfile',
            style: new TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }

  Widget userBuilder(HotelLoginModel model,context)=> InkWell(

    onTap: () {},
    child: Column(
      children: <Widget>[
        // RoundCornerTextInputWidget(
        //     onSubmit: (){},
        //     controler: nameController,
        // ),
        Padding(
          padding:  EdgeInsets.only(left: 8.w, right: 16.w),
          child: Row(
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(left: 16.0.w, bottom: 16.h, top: 16.h),
                child: Text(
                  'Username',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppTheme.getTheme().disabledColor.withOpacity(0.3),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 16.0.w, bottom: 16.h, top: 16.h),
                child: Text(
                  //'${HotelCubit.get(context).userModel!.data!.name}',
                  model.data!.name!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
        myDiveder(),
        Padding(
          padding:  EdgeInsets.only(left: 8.w, right: 16.w),
          child: Row(
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(left: 16.0.w, bottom: 16.h, top: 16.h),
                child: Text(
                     'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppTheme.getTheme().disabledColor.withOpacity(0.3),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 16.0.w, bottom: 16.h, top: 16.h),
                child: Text(
                  //'${HotelCubit.get(context).userModel!.data!.name}',
                  model.data!.email!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
        myDiveder(),
        Padding(
          padding:  EdgeInsets.only(left: 8.w, right: 16.w),
          child: Row(
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(left: 16.0.w, bottom: 16.h, top: 16.h),
                child: Text(
                     'phone',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppTheme.getTheme().disabledColor.withOpacity(0.3),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 16.0.w, bottom: 16.h, top: 16.h),
                child: Text(
                  //'${HotelCubit.get(context).userModel!.data!.name}',
                  model.data!.phone!,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
        myDiveder(),
        Padding(
          padding:  EdgeInsets.only(left: 8.w, right: 16.w),
          child: Row(
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(left: 16.0.w, bottom: 16.h, top: 16.h),
                child: Text(
                     'Date of birth',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    color: AppTheme.getTheme().disabledColor.withOpacity(0.3),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 16.0.w, bottom: 16.h, top: 16.h),
                child: Text(
                   //'${HotelCubit.get(context).userModel!.data!.name}',
                  ' 20, Aug, 1990',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
          padding: EdgeInsets.all(15),
          child: RoundCornerButtonWidget(
            title:'update' ,
            onTap: () {
              if (formKey.currentState!.validate()!=null) {
                HotelCubit.get(context).updateUserData(
                  name: nameController.text,
                  email: emailController.text,
                  phone: phoneController.text,
                );
              }},
            bgColor: ColorHelper.primaryColor,
          ),
        ),




      ],
    ),
  );


}

