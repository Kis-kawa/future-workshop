import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';

class GameSetting extends StatelessWidget {
  const GameSetting({super.key});

  @override
  Widget build(BuildContext context) {

  const drawer = Drawer(
    child: SideBar(),
  );

  final appBar = AppBar(
    title: const Text("試合モードの設定"),
    backgroundColor: Colors.red[300],
  );

  final scaffold = Scaffold(
    appBar: appBar,
    body: const Text("試合: 設定"),
    drawer: drawer,
  );

    return scaffold;
  }

}
