import 'package:flutter/material.dart';
import 'package:imtihon/core/consts.dart';
import 'package:imtihon/core/widgets.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class TasbehPage extends StatefulWidget {
  String? title;
  TasbehPage({Key? key, this.title}) : super(key: key);

  @override
  _TasbehPageState createState() => _TasbehPageState();
}

double percent = 0;
int count = 0;
int yuzta = 0;

class _TasbehPageState extends State<TasbehPage> {
  @override
  void dispose() {
    count = 0;
    percent = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: Widgets.kAppBar("${widget.title}"),
      body: Center(
        child: InkWell(
          splashColor: Colors.white,
          highlightColor: Colors.transparent,
          child: CircularPercentIndicator(
            radius: MediaQuery.of(context).size.height * 0.15,
            lineWidth: MediaQuery.of(context).size.height * 0.01,
            progressColor: count < 33 ? Colors.green : Constants.kPrimaryColor,
            percent: percent,
            center: Text(
              count.toString(),
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.07,
                  color: count < 33 ? Colors.green : Constants.kPrimaryColor),
            ),
          ),
          onTap: () {
            percent += 0.01;
            count += 1;
            if (count == 100) {
              dialog();
              percent = 0;
              count = 0;
              yuzta += 1;
            }
            setState(() {});
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.restart_alt),
        backgroundColor: Constants.kPrimaryColor,
        onPressed: () {
          percent = 0;
          count = 0;
          setState(() {});
        },
      ),
    );
  }

  dialog() {
    return showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Barokalloh"),
          );
        });
  }
}
