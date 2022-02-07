import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imtihon/core/alarm.dart';
import 'package:imtihon/core/consts.dart';
import 'package:imtihon/core/widgets.dart';

class NamozVaqtlari extends StatefulWidget {
  String? title;
  NamozVaqtlari({Key? key, this.title}) : super(key: key);

  @override
  _NamozVaqtlariState createState() => _NamozVaqtlariState();
}

class _NamozVaqtlariState extends State<NamozVaqtlari> {
  bool _checkValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.kAppBar("${widget.title}"),
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/namoz_page.jpg"),
              fit: BoxFit.cover),
        ),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.08,
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.02,
                  vertical: MediaQuery.of(context).size.height * 0.025),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Constants.namozNomlari[index],
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      color: Constants.kTextColor,
                    ),
                  ),
                  Text(
                    Constants.namozlar[index],
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.04,
                      color: Constants.kTextColor,
                    ),
                  ),
                  CupertinoSwitch(
                    value: Constants.checkValue[index],
                    onChanged: (v) {
                      Constants.checkValue[index] = v;
                      if (Constants.checkValue[index]) {
                        NotificationService().showNotification(
                            Constants.a[index], Constants.c[index]);
                        setState(() {});
                      } else {
                        NotificationService().cancelAllNotifications();
                        setState(() {});
                      }
                    },
                  ),
                ],
              ),
            );
          },
          itemCount: Constants.namozlar.length,
        ),
      ),
    );
  }
}
