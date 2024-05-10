import 'package:flutter/material.dart';

showSnackBar(BuildContext context, {String ?message}){
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message ?? 'Please fill out the required fields'),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 2),
      )
  );
}