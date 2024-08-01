import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';

class PracticeSetting extends StatelessWidget {
  const PracticeSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    const drawer = Drawer(
      backgroundColor: Color.fromARGB(255, 34, 130, 135),
      child: SideBar(),
    );

    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 34, 130, 135),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(width: 150),
          Text(
            "練習の設定",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Spacer(),
        ],
      ),
      actions: [
        Image.asset("images/hoshikawa.png"),
        const Text(
          "Judo Timer",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        const SizedBox(width: 80),
      ],
      elevation: 0,
    );

    final backRegion = SizedBox(
      width: deviceWidth * 0.9,
      height: deviceHeight * 0.8,
      child: Row(children: [
        Container(
          width: deviceWidth * 0.45,
          color: Colors.amber,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: (deviceHeight*0.8)*0.18,
                color: const Color.fromARGB(255, 205, 87, 87),
                padding: const EdgeInsets.all(30),
                child: const Text("data"),
              ),
              Container(
                alignment: Alignment.topCenter,
                height: (deviceHeight*0.8)*0.82,
                color: Colors.pinkAccent,
                padding: const EdgeInsets.all(30),
                // child: listview,
              ),
            ],
          ),
        ),
        Container(
          width: deviceWidth * 0.45,
          color: Colors.black,
        ),
      ],),
    );

    final scaffold = Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 217, 194),
      appBar: appBar,
      body: Center(child: backRegion,),
      drawer: drawer,
    );

    return scaffold;
  }
}
