import 'package:imtihon/service/imtihon_service.dart';
import 'package:flutter/material.dart';

class Constants {
  static Color kPrimaryColor = const Color(0xFF013E33);

  static Color kTextColor = const Color(0xFFACBD8F);

  static List namozlar = [
    SerivceImtihon.malumot[0]['times']['tong_saharlik'],
    SerivceImtihon.malumot[0]['times']['quyosh'],
    SerivceImtihon.malumot[0]['times']['peshin'],
    SerivceImtihon.malumot[0]['times']['asr'],
    SerivceImtihon.malumot[0]['times']['shom_iftor'],
    SerivceImtihon.malumot[0]['times']['hufton'],
  ];
  static List<String> namozNomlari = [
    "Saharlik",
    "Peshin",
    "Asr",
    "Shom",
    "Hufton",
  ];

  static List<String> rasmlar = [
    "assets/images/namoz_vaqt.jpg",
    "assets/images/masjid.jpg",
    "assets/images/quron.jpg",
    "assets/images/qiblaa.jpg",
    "assets/images/kalendar.jpg",
    "assets/images/tasbeh.jpg",
    "assets/images/ustun.jpg",
    "assets/images/duo.jpg",
    "assets/images/info.jpg",
  ];

  static List<String> rasmNom = [
    "Namoz Vaqtlari",
    "Masjidlar",
    "Qur'on",
    "Qibla",
    "Kalendar",
    "Tasbeh",
    "5 Ustun",
    "Duolar",
    "Biz Haqimizda",
  ];
  static navigator(context, int num) {
    if (num == 0) {
      return Navigator.pushNamed(
        context,
        '/namozVaqtlari',
        arguments: "Namoz Vaqtlari",
      );
    } else if (num == 1) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog();
          });
    }
  }

  static int vaqt = DateTime.now().hour;
  static List b = [];
  static List<int> a = [];

  static test() {
    b.clear();
    for (var i = 0; i < namozlar.length; i++) {
      b.add(namozlar[i].toString().split(":"));
    }
    return b[0][0];
  }

  static vaqtKorsat() {
    a.clear();
    for (int i = 0; i < namozlar.length; i += 1) {
      b.add(namozlar[i].toString().split(":"));

      a.add(int.parse(b[i][0]));
    }
    if (vaqt >= 00 && vaqt < a[0]) {
      return namozlar[0];
    } else if (vaqt >= a[0] && vaqt < a[2]) {
      return namozlar[2];
    } else if (vaqt >= a[2] && vaqt < a[3]) {
      return namozlar[3];
    } else if (vaqt >= a[3] && vaqt < a[4]) {
      return namozlar[4];
    } else if (vaqt >= a[4] && vaqt < a[5]) {
      return namozlar[5];
    } else if (vaqt >= a[5]) {
      return namozlar[0];
    }
  }

  static vaqtJonat() {
    if (vaqtKorsat() == namozlar[0]) {
      return namozNomlari[0];
    } else if (vaqtKorsat() == namozlar[2]) {
      return namozNomlari[2];
    } else if (vaqtKorsat() == namozlar[3]) {
      return namozNomlari[3];
    } else if (vaqtKorsat() == namozlar[4]) {
      return namozNomlari[4];
    } else if (vaqtKorsat() == namozlar[5]) {
      return namozNomlari[5];
    }
  }
}
