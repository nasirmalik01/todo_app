import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/res/app_generics/generics.dart';
import 'package:todo_app/res/colors.dart';
import 'package:todo_app/res/strings.dart';

Widget elevatedButtonWidget({required Function() onPress}){
  return ElevatedButton(
    onPressed: onPress,
    style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blueColor,
        padding: EdgeInsets.symmetric(
            horizontal: sizes.width * 0.15,
            vertical: sizes.height * 0.017
        ),
        textStyle: TextStyle(
          fontSize: sizes.fontSize20,
        )),
    child: const Text(AppStrings.update, style: TextStyle(
        color: AppColors.pureWhiteColor
    ),),
  );
}