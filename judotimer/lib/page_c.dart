import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';

class GameHome extends StatelessWidget {
  const GameHome({super.key});

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
    body: const Text("試合: ホーム"),
    drawer: drawer,
  );

    return scaffold;
  }

}
