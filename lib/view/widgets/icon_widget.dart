import 'package:flutter/material.dart';
import 'package:todo_app/res/app_generics/generics.dart';
import 'package:todo_app/res/colors.dart';

Widget iconWidget({
  required IconData icon,
  required Function() onPress,
  Color? color
}){
  return Container(
    padding: const EdgeInsets.all(0),
    margin: const EdgeInsets.symmetric(vertical: 12),
    width: sizes.width * 0.08,
    decoration: BoxDecoration(
      color: color ?? AppColors.redColor,
      borderRadius: BorderRadius.circular(5),
    ),
    child: IconButton(
      color: Colors.white,
      iconSize: sizes.width * 0.04,
      icon: Icon(icon),
      onPressed: onPress
    ),
  );
}