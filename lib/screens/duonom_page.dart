import 'package:flutter/material.dart';
import 'package:imtihon/core/data.dart';
import 'package:imtihon/core/widgets.dart';

class DuoNomPage extends StatefulWidget {
  const DuoNomPage({Key? key}) : super(key: key);

  @override
  _DuoNomPageState createState() => _DuoNomPageState();
}

class _DuoNomPageState extends State<DuoNomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.kAppBar("Duolar"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: ListTile(
                  title: Text(Data.duoNom[index]),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/duoPage",
                  arguments: [Data.duo[index]],
                );
              },
            );
          },
          itemCount: Data.duoNom.length,
        ),
      ),
    );
  }
}
