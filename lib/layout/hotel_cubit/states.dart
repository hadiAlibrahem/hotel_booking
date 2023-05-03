import 'package:hotel_booking/models/booking_model.dart';
import 'package:hotel_booking/models/chang_favorites_model.dart';
import 'package:hotel_booking/models/login_model.dart';

abstract class HotelStates{}

class InitialState extends HotelStates{
}
class AppChangModeState extends HotelStates{}

class ChangBottomNavBarState extends HotelStates{}

class HotelLoadingHomeDataState extends HotelStates{}

class HotelSuccessHomeDataState extends HotelStates{}

class HotelErrorHomeDataState extends HotelStates{}


class HotelSuccessCategoriesState extends HotelStates{}

class HotelErrorCategoriesState extends HotelStates{}


class HotelChangFavoritesState extends HotelStates{}

class HotelSuccessChangFavoritesState extends HotelStates{
  final changeFavoritesModel ? model;

  HotelSuccessChangFavoritesState(this.model);
}

class HotelErrorChangFavoritesState extends HotelStates{}

class HotelLoadingGetFavoritesState extends HotelStates{}

class HotelSuccessGetFavoritesState extends HotelStates{}

class HotelErrorGetFavoritesState extends HotelStates{}


class HotelLoadingUserDataState extends HotelStates{}

class HotelSuccessUserDataState extends HotelStates{
  final HotelLoginModel ?loginModel;

  HotelSuccessUserDataState(this.loginModel);
}

class HotelErrorUserDataState extends HotelStates{}


class HotelLoadingUpdateUserState extends HotelStates{}

class HotelSuccessUpdateUserState extends HotelStates{
  final HotelLoginModel ?loginModel;

  HotelSuccessUpdateUserState(this.loginModel);
}

class HotelErrorUpdateUserState extends HotelStates{}



class HotelChangisFavoritedState extends HotelStates{}


class ReadJsonDataState extends HotelStates{}



////////////////////////////////////////////////////////////////////////////////////////////////
class HotelBookingLoadingState extends HotelStates{}

class HotelBookingSuccessState extends HotelStates{
  final BookingModel ?bookingModelApply;

  HotelBookingSuccessState(this.bookingModelApply);
}

class HotelBookingErrorState extends HotelStates{
  final String error;

  HotelBookingErrorState(this.error);
}


class HotelLoadingUserBookState extends HotelStates{}

class HotelSuccessUserBookState extends HotelStates{
  final BookingModel ?bookingModel;

  HotelSuccessUserBookState(this.bookingModel);
}

class HotelErrorUserBookState extends HotelStates{}


