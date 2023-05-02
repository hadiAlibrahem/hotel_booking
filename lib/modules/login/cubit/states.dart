import 'package:hotel_booking/models/login_model.dart';

abstract class HotelLoginStates {}

class HotelLoginInitialState extends HotelLoginStates{}

class HotelLoginLoadingState extends HotelLoginStates{}

class HotelLoginSuccessState extends HotelLoginStates{
  final HotelLoginModel loginModel;

  HotelLoginSuccessState(this.loginModel);
}

class HotelLoginErrorState extends HotelLoginStates{
  final String error;

  HotelLoginErrorState(this.error);
}

class HotelChangPasswordVisibilityState extends HotelLoginStates{}



class HotelLoginErrorStateInEmail extends HotelLoginStates{
  final String error;

  HotelLoginErrorStateInEmail(this.error);
}


class HotelLoginErrorStateInPassword extends HotelLoginStates{
  final String error;

  HotelLoginErrorStateInPassword(this.error);
}

class HotelLoginErrorStateInValedEmail extends HotelLoginStates{
  final String error;

  HotelLoginErrorStateInValedEmail(this.error);

}class HotelLoginErrorStateInTOShortPassword extends HotelLoginStates{
  final String error;

  HotelLoginErrorStateInTOShortPassword(this.error);
}
