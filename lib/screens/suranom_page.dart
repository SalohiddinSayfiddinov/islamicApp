import 'package:flutter/material.dart';
import 'package:imtihon/core/data.dart';
import 'package:imtihon/core/widgets.dart';

class SuraNomPage extends StatefulWidget {
  const SuraNomPage({Key? key}) : super(key: key);

  @override
  _SuraNomPageState createState() => _SuraNomPageState();
}

class _SuraNomPageState extends State<SuraNomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.kAppBar("Suralar"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: ListTile(
                  title: Text(Data.suraNom[index]),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/suralarPage",
                  arguments: Data.suralar[index],
                );
              },
            );
          },
          itemCount: Data.suraNom.length,
        ),
      ),
    );
  }
}
