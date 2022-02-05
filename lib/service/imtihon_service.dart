import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class SerivceImtihon {
  static int day = DateTime.now().day;
  static List datas = [];
  static var malumot;
  static Future getData() async {
    await openBox();
    try {
      Response res = await Dio().get(
          "https://namozvaqti.herokuapp.com/api/monthly?region=andijon&month=2");

      await putData(res.data);
    } catch (e) {
      print("NO INTERNET CONNECTION");
    }
    List myData = box!.toMap().values.toList();

    if (myData.isEmpty) {
      datas.add("nodata");
    } else {
      datas = myData;
    }
  }

  static Box? box;

  static Future openBox() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocDir.path);

    return;
  }

  static putData(data) async {
    box = await Hive.box("namozvaqt");
    await box!.clear();
    // ADD YOUR DATA HEER!!!
    for (var d in data) {
      if (d['day'] == day) {
        box!.add(d);
      }
    }
  }
}
