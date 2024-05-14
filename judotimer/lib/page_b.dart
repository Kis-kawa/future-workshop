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
    title: const Text("練習モードの設定"),
    backgroundColor: Colors.green[300],
  );

  final scaffold = Scaffold(
    appBar: appBar,
    body: const Text("練習: 設定"),
    drawer: drawer,
  );

    return scaffold;
  }
}
