import 'package:flutter/material.dart';
import 'package:imtihon/core/consts.dart';

class Widgets {
  static kAppBar(String title) {
    return AppBar(
      title: Text(title),
      backgroundColor: Constants.kPrimaryColor,
    );
  }
}
