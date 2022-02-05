import 'package:flutter/material.dart';
import 'package:imtihon/core/widgets.dart';

class NamozVaqtlari extends StatefulWidget {
  String? title;
  NamozVaqtlari({Key? key, this.title}) : super(key: key);

  @override
  _NamozVaqtlariState createState() => _NamozVaqtlariState();
}

class _NamozVaqtlariState extends State<NamozVaqtlari> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.kAppBar("${widget.title}"),
    );
  }
}
