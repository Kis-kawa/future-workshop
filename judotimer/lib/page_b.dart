import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';

class PracticeSetting extends StatelessWidget {
  const PracticeSetting({super.key});

  @override
  Widget build(BuildContext context) {

  const drawer = Drawer(
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
  child: AspectRatio(
    aspectRatio: 1248 / 843,
    child: Container(
      padding: const EdgeInsets.all(30),
      child: Container(
        color: Colors.amber,//背景
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 5, 20),
                child: Container(color: Colors.blue,),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                child: Container(color: Colors.red,),
              ),
            ),
          ],
        ),
        ),
    ),
  ),
);

  final scaffold = Scaffold(
    backgroundColor: const Color.fromARGB(255, 24, 24, 24),
    appBar: appBar,
    body: Center(child: backRegion,),
    drawer: drawer,
  );

    return scaffold;
  }
}
