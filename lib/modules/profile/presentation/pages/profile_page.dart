import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/shared/compoment/components.dart';
import 'package:hotel_booking/ui/appTheme.dart';

import '../../../settings/domain/entities/setting_entity.dart';
import '../../../password_recovery/presentation/pages/change_password_page.dart';
import 'edit_profile_page.dart';
import 'help_center_page.dart';
import 'invite_page.dart';
import '../../../settings/presentation/pages/settings_page.dart';
class ProfilePage extends StatefulWidget {
  final AnimationController? animationController;
  const ProfilePage({Key? key, this.animationController}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<SettingEntity> userSettingsList = SettingEntity.userSettingsList;


  // void initState() {
  //   widget.animationController!.forward();
  //   super.initState();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor:AppCubit.get(context).isDark? AppTheme.getTheme().primaryColor:AppTheme.getTheme().backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            //padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: Container(
              child: appBar(context),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.all(0.0),
              itemCount: userSettingsList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (index == 5) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SettingsPage(),
                            fullscreenDialog: true,
                          ));
                    }
                    if (index == 3) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HelpCenterPage(),
                          fullscreenDialog: true,
                        ),
                      );
                    }
                    if (index == 0) {
                      navigateTo(context, ChangePasswordPage());
                    }
                    if (index == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InvitePage(),
                          fullscreenDialog: true,
                        ),
                      );
                    }
                  },
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 16),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  userSettingsList[index].titleTxt!,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                child: Icon(
                                    userSettingsList[index].iconData,
                                    color: AppTheme
                                        .getTheme()
                                        .disabledColor
                                        .withOpacity(0.3)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Divider(
                          height: 1,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

    Widget appBar(context) {
      return InkWell(
        onTap: () {
          navigateTo(context, EditProfilePage());
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'amanda',
                      style: new TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'view And Edit Profile',
                      style: new TextStyle(
                        fontSize: 18,
                        color: AppTheme
                            .getTheme()
                            .disabledColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 0, bottom: 16),
              child: Container(
                width: 70,
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                  child: Image.asset("assets/images/userImage.png"),
                ),
              ),
            )
          ],
        ),
      );
    }
  }

