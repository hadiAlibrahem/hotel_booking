

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/layout/hotel_cubit/cubite.dart';
import 'package:hotel_booking/layout/hotel_cubit/states.dart';
import 'package:hotel_booking/ui/color_helper.dart';



import '../../ui/appTheme.dart';

Widget RoundCornerTextInputWidget({
  String? hintText,
  Key? inputTextKey,
  TextInputType?  keyboardType,
  Widget? suffix ,
  bool? obscurePassword ,
  bool isPasword = false,
  Widget? prefix ,
  required Function? onSubmit,
  required TextEditingController? controler,
})
{
  return  BlocConsumer<HotelCubit,HotelStates>(
    listener: (context,state){},
    builder: (context,state){
      return  Container(
        decoration: BoxDecoration(
          color:HotelCubit.get(context).isDark?AppTheme.newDarkTheme().backgroundColor:AppTheme.newLightTheme().backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(38)),
          border: HotelCubit.get(context).isDark?Border.all(color:Colors.white.withOpacity(0.9)):Border.all(color:Colors.white),
           // Border.all(
           //  color:HexColor("#757575").withOpacity(0.1),),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: ColorHelper.dividerColor,
              blurRadius:8,
              offset: Offset(4, 4),),
          ],),

        child: TextFormField(
          controller: controler,
          keyboardType:keyboardType,
          obscureText: obscurePassword??false,
          decoration: InputDecoration(
            hintText:hintText??'' ,
            border: InputBorder.none,
            prefixIcon: prefix,
            suffixIcon:suffix,
          ),
        ),
      );
    },

  );

}





// class RoundCornerTextInputWidget extends StatelessWidget {
//
//   final String? hintText;
//   final String? initialValue;
//   final Key? inputTextKey;
//   final  TextInputType?  keyboardType;
//   final Icon? suffix ;
//   final Icon?prefix ;
//   final  TextEditingController? controllar;
//   final bool? obscurePassword ;
//   final Function? ontap;
//   final  Function? validate;
//
//   const RoundCornerTextInputWidget(
//       {Key? key,
//       this.obscurePassword,
//        this.controllar,
//       this.hintText,
//       this.initialValue,
//       this.inputTextKey,
//       this.keyboardType,
//         this.suffix,
//         this.prefix,
//           this.ontap,
//         this.validate,
//       }
//
//       )
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     AppCubit  cubit_Mode=AppCubit.get(context);
//     return Container(
//       decoration: BoxDecoration(
//         color:cubit_Mode.isDark?Colors.black:Colors.white54,
//         borderRadius: BorderRadius.all(Radius.circular(15)),
//         border: Border.all(
//           color: HexColor("#757575").withOpacity(0.2),
//          ),
//         boxShadow: <BoxShadow>[
//           BoxShadow(
//             color: ColorHelper.dividerColor,
//             blurRadius: 8,
//             offset: Offset(4, 4),
//           ),
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.only(left:20, right: 20,),
//         child: Container(
//           height: 48,
//           child: Center(
//             child: Container(
//               height: 40,
//               child: TextFormField(
//                // validator: validate!(),
//               //  onTap:ontap!() ,
//                 obscureText:obscurePassword??false,
//                 keyboardType: keyboardType ,
//                 key: inputTextKey,
//                 initialValue: initialValue ?? '',
//                 maxLines: 1,
//                 style: TextStyle(fontSize: 16,
//                //    color: AppTheme.dark_grey,
//                 ),
//
//                 cursorColor: ColorHelper.primaryColor,
//                 decoration: InputDecoration(
//                   suffix:suffix ,
//                   prefix: prefix,
//
//                   errorText: null,
//                   border: InputBorder.none,
//                   hintText: hintText ?? '',
//                   hintStyle: TextStyle(color: ColorHelper.disabledColor),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
