import 'package:flutter/material.dart';
import 'package:imtihon/core/data.dart';
import 'package:imtihon/core/widgets.dart';

class SuralarPage extends StatefulWidget {
  String? sura;

  SuralarPage({Key? key, this.sura}) : super(key: key);

  @override
  State<SuralarPage> createState() => _SuralarPageState();
}

class _SuralarPageState extends State<SuralarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.kAppBar("Suralar"),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Text(
            "${widget.sura}",
            style:
                TextStyle(fontSize: MediaQuery.of(context).size.height * 0.05),
          ),
        ),
      ),
    );
  }
}
