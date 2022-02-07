import 'package:flutter/material.dart';
import 'package:imtihon/core/consts.dart';

class Widgets {
  static kAppBar(String title) {
    return AppBar(
      iconTheme: IconThemeData(color: Constants.kTextColor),
      title: Text(
        title,
        style: TextStyle(color: Constants.kTextColor),
      ),
      backgroundColor: Constants.kPrimaryColor,
    );
  }
}
