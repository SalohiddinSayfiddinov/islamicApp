import 'package:flutter/material.dart';
import 'package:imtihon/core/consts.dart';
import 'package:imtihon/core/data.dart';
import 'package:imtihon/core/widgets.dart';

class BeshUstunPage extends StatefulWidget {
  BeshUstunPage({Key? key}) : super(key: key);

  @override
  _BeshUstunPageState createState() => _BeshUstunPageState();
}

class _BeshUstunPageState extends State<BeshUstunPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.kAppBar("Islomning 5 Ustuni"),
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
              child: Text(
                Data.beshUstun[index],
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.04,
                  color: Constants.kTextColor,
                ),
              ),
            );
          },
          itemCount: Data.beshUstun.length,
        ),
      ),
    );
  }
}
