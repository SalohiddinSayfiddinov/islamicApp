import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:imtihon/core/consts.dart';
import 'package:imtihon/service/imtihon_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    SerivceImtihon.getData();
    super.initState();
  }

  int num = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.kPrimaryColor,
        title: Text(
          "Tashkent, Uzbekistan",
          style: TextStyle(color: Constants.kTextColor),
        ),
      ),
      body: ValueListenableBuilder<Box>(
        valueListenable: Hive.box("namozvaqt").listenable(),
        builder: (context, box, __) {
          SerivceImtihon.malumot = box.values.toList();
          return Column(
            children: [
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/background.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        Constants.vaqtKorsat(),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          color: Constants.kTextColor,
                        ),
                      ),
                      Text(
                        Constants.vaqtJonat(),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          color: Constants.kTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Container(
                  color: const Color(0xFF034642),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3),
                    itemBuilder: (context, index) {
                      return InkWell(
                        child: Container(
                          margin: const EdgeInsets.all(1.0),
                          color: Constants.kPrimaryColor,
                          child: Column(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                width: MediaQuery.of(context).size.width * 0.1,
                                child: Image.asset(
                                  Constants.rasmlar[index],
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  Constants.rasmNom[index],
                                  style: TextStyle(color: Constants.kTextColor),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          num = index;
                          Constants.navigator(context, num);
                        },
                      );
                    },
                    itemCount: 9,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  FutureBuilder futurebuilderim() {
    return FutureBuilder(
      future: SerivceImtihon.getData(),
      builder: (context, AsyncSnapshot snap) {
        if (!snap.hasData) {
          return const CircularProgressIndicator.adaptive();
        } else if (SerivceImtihon.datas.contains("nodata")) {
          return const Center(child: Text("ERROR"));
        } else {
          List data = SerivceImtihon.datas;
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Constants.namozlar[index]),
                );
              },
              itemCount: Constants.namozlar.length,
            ),
          );
        }
      },
    );
  }
}
