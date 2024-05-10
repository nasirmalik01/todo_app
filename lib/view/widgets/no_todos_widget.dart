import 'package:flutter/cupertino.dart';
import 'package:todo_app/res/app_generics/generics.dart';

Widget noToDosMessageWidget({required String message}){
  return Center(
      child: Padding(
        padding: EdgeInsets.only(
            top: sizes.height * 0.1
        ),
        child: Text(
          message,
          style: TextStyle(
            fontSize: sizes.fontSize20,
            fontWeight: FontWeight.w400,
          ),),
      )
  );
}