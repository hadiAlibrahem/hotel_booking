
import 'package:flutter/material.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/models/booking_model.dart';
import 'package:hotel_booking/models/categories_model.dart';
import 'package:hotel_booking/models/chang_favorites_model.dart';
import 'package:hotel_booking/models/favorites_model.dart';
import 'package:hotel_booking/models/home_model.dart';
import 'package:hotel_booking/models/login_model.dart';
import 'package:hotel_booking/modules/booking_room/Widgets/data.dart';
import 'package:hotel_booking/modules/favorites/favorites_Screen.dart';
import 'package:hotel_booking/modules/home/home_screen.dart';
import 'package:hotel_booking/modules/my_booking/myboohing_screen.dart';
import 'package:hotel_booking/modules/settings/presentation/pages/settings_page.dart';
import 'package:hotel_booking/shared/compoment/costanse.dart';
import 'package:hotel_booking/shared/network/end_points.dart';
import 'package:hotel_booking/shared/network/remot/dio_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../shared/network/local/cash_helper.dart';



class HotelCubit extends Cubit<HotelStates> {
  HotelCubit() : super(InitialState());

  static HotelCubit get(context) => BlocProvider.of(context);
  bool isDark = false;

  void changAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(AppChangModeState());
      });
    }
  }
  List Hall = [
    {
      "id": 110,
      "name": " Alshark Holl",
      "image": "assets/images/room_9.jpg",
      "price": "300\$",
      "type": categories[1]["name"],
      "rate": "4.5",
      "location": "Phnom Penh",
      "is_favorited": false,
      "album_images": albumImages,
      "description":
      "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    },
    {
      "id": 102,
      "name": "AlHamedua Hall",
      "image":
      "assets/images/room_1.jpg",
      "price": "300\$",
      "type": categories[2]["name"],
      "rate": "4.5",
      "location": "Phnom Penh",
      "is_favorited": false,
      "album_images": albumImages,
      "description":
      "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    },
    {
      "id": 103,
      "name": "AlAmer",
      "image":
      "assets/images/room_5.jpg",
      "price": "\$350",
      "type": categories[2]["name"],
      "rate": "4.5",
      "location": "Phnom Penh",
      "is_favorited": false,
      "album_images": albumImages,
      "description":
      "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    },
  ];

  List<Map<String, dynamic>> features = [
    {
      "endDate": "1",
      "startDate": "1",
      "id": 100,
      "name": "Superior Room",
      "image": "assets/images/room_8.jpg",
      "price": "\$210",
      "type": categories[1]["name"],
      "rate": "4.5",
      "location": "Phnom Penh",
      "is_favorited": false,
      "album_images": albumImages,
      "description":
          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    },
    {
      "endDate": "1",
      "startDate": "1",
      "id": 101,
      "name": "Junior Suite",
      "image": "assets/images/room_11.jpg",
      "price": "\$150",
      "type": categories[3]["name"],
      "rate": "4.5",
      "location": "Phnom Penh",
      "is_favorited": true,
      "album_images": albumImages,
      "description":
          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    },
    {
      "endDate": "1",
      "startDate": "1",
      "id": 102,
      "name": "Classic Queen Room",
      "image": "assets/images/room_1.jpg",
      "price": "\$320",
      "type": categories[2]["name"],
      "rate": "4.5",
      "location": "Phnom Penh",
      "is_favorited": false,
      "album_images": albumImages,
      "description":
          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    },
    {
      "endDate": "1",
      "startDate": "1",
      "id": 103,
      "name": "Luxury King",
      "image": "assets/images/room_5.jpg",
      "price": "\$350",
      "type": categories[2]["name"],
      "rate": "4.5",
      "location": "Phnom Penh",
      "is_favorited": false,
      "album_images": albumImages,
      "description":
          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    },
    {
      "endDate": "1",
      "startDate": "1",
      "id": 104,
      "name": "Classic Room",
      "image": "assets/images/hotel_room_4.jpg",
      "price": "\$180",
      "type": categories[4]["name"],
      "rate": "4.5",
      "location": "Phnom Penh",
      "is_favorited": false,
      "album_images": albumImages,
      "description":
          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    },
    {
      "endDate": "1",
      "startDate": "1",
      "id": 105,
      "name": "Twin Room",
      "image": "assets/images/room_9.jpg",
      "price": "\$250",
      "type": categories[1]["name"],
      "rate": "4.5",
      "location": "Phnom Penh",
      "is_favorited": false,
      "album_images": albumImages,
      "description":
          "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    },
  ];

  //bool  isavorited;
  bool getisFavorited(index) {
    bool isFavorited = features[index]["is_favorited"];
    return isFavorited;
  }

  void ChangisFavorited(index) {
    // isFavorited=!isFavorited;
    features[index]["is_favorited"] = !features[index]["is_favorited"];
    emit(HotelChangisFavoritedState());
  }


  void ChangisDate(index,DateTime d1,DateTime d2) {
    // isFavorited=!isFavorited;

    features[index]["startDate"] = '${DateFormat("dd, MMM").format(d1)}';
    features[index]["endDate"] = '${DateFormat("dd, MMM").format(d2)}';


   // emit(HotelChangisFavoritedState());
  }


  int currentIndex = 0;
  List<Widget> bottomScreens = [
    HomeScreen(),
    MyBokingScreen(),
    FavoritesScreen(),
    SettingsPage(),

  ];

  void chanBottom(int index) {
    currentIndex = index;
    emit(ChangBottomNavBarState());
  }

  HomeModel? homeModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(HotelLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      homeModel = HomeModel.fromJson(value!.data);
      // print(homeModel?.status);
      // print(homeModel?.data?.banners[0].id);
      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      print(favorites.toString());
      emit(HotelSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(HotelErrorHomeDataState());
    });
  }



  changeFavoritesModel? changefavoritesModel;

  void changFavorites(int productId) {
    favorites[productId] = !favorites[productId]!;
    emit(HotelChangFavoritesState());
    DioHelper.postData(
      url: FAVORITES,
      data: {
        "product_id": productId,
      },
      token: token,
    ).then((value) {
      changefavoritesModel = changeFavoritesModel.fromJson(value!.data);

      if (changefavoritesModel?.status == false) {
        favorites[productId] = !favorites[productId]!;
      } else {
        getFavorites();
      }

      emit(HotelSuccessChangFavoritesState(changefavoritesModel));
    }).catchError((error) {
      favorites[productId] = !favorites[productId]!;

      emit(HotelErrorChangFavoritesState());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(HotelLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      favoritesModel = FavoritesModel.fromJson(value?.data);

      emit(HotelSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(HotelErrorGetFavoritesState());
    });
  }

  HotelLoginModel? userModel;

  void getUserData() {
    emit(HotelLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = HotelLoginModel.formJson(value!.data);
      printFullText(userModel!.data!.name!);
      emit(HotelSuccessUserDataState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(HotelErrorUserDataState());
    });
  }

  HotelLoginModel? updateModel;

  void updateUserData({
    required String name,
    required String email,
    required String phone,

  }) {
    emit(HotelLoadingUpdateUserState());
    DioHelper.putData(
      url: UPDATE_PROFILE,
      token: token,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      updateModel = HotelLoginModel.formJson(value!.data);

      print(updateModel!.data!.name);

      emit(HotelSuccessUpdateUserState(updateModel));
    }).catchError((error) {
      print(error.toString());
      emit(HotelErrorUpdateUserState());
    });
  }

/////////////////////////////////////////////////////////////////////////////////

  BookingModel ?bookingModelApply;
  void userBook({
     int? rooms,
     required DateTime startDate ,
     required DateTime endDate ,
  })
  {
    emit(HotelBookingLoadingState());
    DioHelper.postData(
      url: BOOK,
      token:token,
      data: {
        'startDate':startDate,
        'endDate':endDate,
        'rooms':rooms??'',
      },
    ).then((value)
    {

      bookingModelApply=BookingModel.formJson(value?.data);
//   print(loginModel?.status);
//   print(loginModel?.message);
//   print(loginModel?.data?.token);
      emit(HotelBookingSuccessState(bookingModelApply!));
    }).catchError((error)
    {
      print(error.toString());
      emit(HotelBookingErrorState(error.toString()));
    });
  }




  BookingModel? bookingModel;

  void getUserBook() {
    emit(HotelLoadingUserBookState());
    DioHelper.getData(
      url: MYBOOKING,
      token: token,
    ).then((value) {
      bookingModel = BookingModel.formJson(value!.data);
     // printFullText(userModel!.data!.name!);
      emit(HotelSuccessUserBookState(bookingModel));
    }).catchError((error) {
      print(error.toString());
      emit(HotelErrorUserBookState());
    });
  }



}
