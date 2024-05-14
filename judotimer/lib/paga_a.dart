import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';

class PracticeHome extends StatelessWidget {
  const PracticeHome({super.key});

  @override
  Widget build(BuildContext context) {

  const drawer = Drawer(
    child: SideBar(),
  );

  final appBar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  final scaffold = Scaffold(
    appBar: appBar,
    body: const Text("練習: ホーム"),
    drawer: drawer,
  );

    return scaffold;
  }
}
