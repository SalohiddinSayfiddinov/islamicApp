import 'package:flutter/material.dart';

class MasjidPage extends StatefulWidget {
  const MasjidPage({Key? key}) : super(key: key);

  @override
  _MasjidPageState createState() => _MasjidPageState();
}

class _MasjidPageState extends State<MasjidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Masjidlar"),
      ),
    );
  }
}
