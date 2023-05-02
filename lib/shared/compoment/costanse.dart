

import 'package:hotel_booking/modules/login/login_page.dart';
import 'package:hotel_booking/shared/network/local/cash_helper.dart';

import 'components.dart';

class UserModel {
  final int? id;

  final String? titel;

  final String? date;

  final String? time;

  final String? status;

  UserModel({
    this.id,
    this.titel,
    this.date,
    this.time,
    this.status,
  });
}

List<UserModel> tasks = [
  UserModel(
    id: 1,
    titel:'met a my doctor' ,//,'${titlecontroolar.text}'
    time:'9:00 AM' ,//,'${timecontroolar.text}'
    date: '21-11-2022',
    status: 'new',
  ),
  UserModel(
    id: 2,
    titel: 'go to uvivercity',
    time: '11:30 AM',
    date: '16-11-2022',
    status: 'new',
  ),
  UserModel(
    id: 3,
    titel: 'play football',
    time: '04:00 PM',
    date: '17-11-2022',
    status: 'new',
  ),
];

List<UserModel> donetasks = [
  UserModel(
    id: 1,
    titel:'met a my doctor' ,//,'${titlecontroolar.text}'
    time:'9:00 AM' ,//,'${timecontroolar.text}'
    date: '21-11-2022',
    status: 'new',
  ),
  UserModel(
    id: 2,
    titel: 'go to uvivercity',
    time: '11:30 AM',
    date: '16-11-2022',
    status: 'new',
  ),
  UserModel(
    id: 3,
    titel: 'play football',
    time: '04:00 PM',
    date: '17-11-2022',
    status: 'new',
  ),
];

void signOut(context)
{
  CacheHelper.removeData(key:'token').then((value)
  {
    if(value){
      navigateAndFinish(context, LoginPage(),);
    }
  });
}

void printFullText(String text){
  final pattern=RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match)=>print(match.group(0)));
}

//String token='Xbc9HAvYoWy0DyVzSZ4TlQWqeHF3hmiBPVZlnPdaZWra03D8tTonX1AXYauz3akHwzi87z';
String  token='';

