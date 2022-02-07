import 'package:flutter/material.dart';
import 'package:imtihon/core/data.dart';
import 'package:imtihon/core/widgets.dart';

class TasbehNomlariPage extends StatefulWidget {
  const TasbehNomlariPage({Key? key}) : super(key: key);

  @override
  _TasbehNomlariPageState createState() => _TasbehNomlariPageState();
}

class _TasbehNomlariPageState extends State<TasbehNomlariPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Widgets.kAppBar("Zikrlar"),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemBuilder: (context, index) {
            return InkWell(
              child: Card(
                child: ListTile(
                  title: Text(Data.zikrlarArab[index]),
                  subtitle: Text(Data.zikrlarOzbek[index]),
                  trailing: const Text("100 ta"),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  "/tasbehPage",
                  arguments: Data.zikrlarOzbek[index],
                );
              },
            );
          },
          itemCount: Data.zikrlarArab.length,
        ),
      ),
    );
  }
}
