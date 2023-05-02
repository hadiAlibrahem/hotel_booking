import 'package:hotel_booking/models/login_model.dart';

abstract class HotelRegisterStates {}

class HotelRegisterInitialState extends HotelRegisterStates{}

class HotelRegisterLoadingState extends HotelRegisterStates{}

class HotelRegisterSuccessState extends HotelRegisterStates{
  final HotelLoginModel loginModel;

  HotelRegisterSuccessState(this.loginModel);
}

class HotelRegisterErrorState extends HotelRegisterStates{
  final String error;

  HotelRegisterErrorState(this.error);
}

class HotelRegisterChangPasswordVisibilityState extends HotelRegisterStates{}



class HotelLoginErrorStateInEmail extends HotelRegisterStates{
  final String error;

  HotelLoginErrorStateInEmail(this.error);
}
class HotelRegisterErrorStateInPassword extends HotelRegisterStates{
  final String error;

  HotelRegisterErrorStateInPassword(this.error);
}
class HotelRegisterErrorStateInValidEmail extends HotelRegisterStates{
  final String error;

  HotelRegisterErrorStateInValidEmail(this.error);

}
class HotelRegisterErrorStateInTOShortPassword extends HotelRegisterStates{
  final String error;

  HotelRegisterErrorStateInTOShortPassword(this.error);
}
class HotelRegisterErrorStateInName extends HotelRegisterStates{
  final String error;

  HotelRegisterErrorStateInName(this.error);

}
class HotelRegisterErrorStateInValidPhone  extends HotelRegisterStates{
  final String error;

  HotelRegisterErrorStateInValidPhone(this.error);
}
class HotelRegisterErrorStateInPhone extends HotelRegisterStates{
  final String error;

  HotelRegisterErrorStateInPhone(this.error);

}
