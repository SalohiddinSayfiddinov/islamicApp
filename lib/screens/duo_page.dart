import 'package:flutter/material.dart';
import 'package:imtihon/core/data.dart';
import 'package:imtihon/core/widgets.dart';

class DuoPage extends StatefulWidget {
  String? duo;

  DuoPage({Key? key, this.duo}) : super(key: key);

  @override
  State<DuoPage> createState() => _DuoPageState();
}

class _DuoPageState extends State<DuoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.kAppBar("Duolar"),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Text(
            "${widget.duo}",
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.03),
          ),
        ),
      ),
    );
  }
}
