// ignore_for_file: prefer_const_constructors

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:hotel_booking/modules/webview/webView_screen.dart';

import '../../main.dart';
import 'costanse.dart';

Widget defulatButton({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  //double rsdiuse=3.0,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      height: 40.0.h,
      child: MaterialButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          3.0,
        ),
        color: background,
      ),
    );

Widget defaultTextFormField({
  @required TextEditingController? controllar,
  required TextInputType type,
  Function? onSubmit,
  Function? onchange,
  Function? ontap,
  required Function validate,
  required String label,
  bool isPasword = false,
  required IconData prefixe,
  IconData? suffix,
}) =>
    TextFormField(
      controller: controllar,
      keyboardType: type,
      onFieldSubmitted: onSubmit!(),
      onChanged: onchange!(),
      validator: validate(),
      obscureText: isPasword,
      onTap: ontap!(),
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
        prefixIcon: Icon(
          prefixe,
        ),
        suffixIcon: suffix != null ? Icon(suffix) : null,
      ),
    );

Widget buildTaskItem(UserModel tasks) => Dismissible(
      key: Key('tasks.titel.toString()'),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '${tasks.time}',
              ),
            ),
            SizedBox(
              width: 20.0.w,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${tasks.titel}',
                    style: TextStyle(
                      fontSize: 18.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${tasks.date}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.check_box,
                  color: Colors.green,
                )),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.archive,
                  color: Colors.black45,
                )),
          ],
        ),
      ),
      onDismissed: ((direction) {}),
    );
Widget myDiveder() => Padding(
  padding:  EdgeInsets.only(left: 8.w, right: 16.w),
  child:   Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
);

Widget buildArticleItem(article, context) => InkWell(
      onTap: () {
        navigateTo(context, WebViewScreen(article['url']));
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120.0.w,
              height: 120.0.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage('${article!['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0.w,
            ),
            Expanded(
              child: Container(
                height: 120.0.h,
                child: Column(
                  // mainAxisSize: MainAxisSize.min,

                  crossAxisAlignment: CrossAxisAlignment.start,

                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Expanded(
                      child: Text(
                        '${article!['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article!['publishedAt']}',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget articalBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
      condition: list!.length > 0,
      builder: (context) => ListView.separated(
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            buildArticleItem(list![index], context),
        separatorBuilder: (context, index) => myDiveder(),
        itemCount: list.length,
      ),
      fallback: (context) =>
          isSearch ? Container() : Center(child: CircularProgressIndicator()),
    );

void navigateTo(context, Widget) => Navigator?.push(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
    );

void navigateAndFinish(context, Widget) => Navigator?.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (Route<dynamic> route) => false,
    );

void showToast({
  required String text,
  required ToastState state,
})
{
  var sb = SnackBar(
    content:Text(text),
    backgroundColor: chooseToastColor(state),
      action: SnackBarAction(
      textColor: Colors.white,
      onPressed: () {  },
      label: '',
    ),


  );
  ScaffoldMessenger.of(MyApp.navigatorKey.currentState!.context).showSnackBar(sb);
  // Fluttertoast.showToast(
  //   msg:text,
  //   //  msg:'true' ,
  //   toastLength: Toast.LENGTH_LONG,
  //   gravity: ToastGravity.BOTTOM,
  //   timeInSecForIosWeb: 5,
  //   backgroundColor: chooseToastColor(state),
  //   textColor: Colors.white,Ba
  //   fontSize: 16.0,
  // );
}
enum ToastState{SUCCES,ERROR,WARING}

Color chooseToastColor(ToastState stat) {
  Color color;

  switch (stat)
  {
    case ToastState.SUCCES:
     color=Colors.green;
     break;
    case ToastState.ERROR:
     color=Colors.red;
     break;
   case ToastState.WARING:
     color= Colors.yellow;
     break;
}
return color;
}