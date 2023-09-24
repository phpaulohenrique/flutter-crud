import 'package:app_crud/routes/app_routes.dart';
import 'package:flutter/material.dart';

class MyAppBar extends AppBar {

  final String text;
  MyAppBar({
    required this.text
  }

  ):super(
    // iconTheme: const IconThemeData(
    //   color: Colors.black, //change your color here
    // ),
    backgroundColor: Colors.grey[50],
    title: Center(
      child: Container(
        width: 1000,
        child: Text(
          text,
          style: TextStyle(color: Colors.grey[900]),
        ),
      ),
    ),
    elevation: 10,


  );
}