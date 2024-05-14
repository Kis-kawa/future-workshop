import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    final imageHeader = Image.asset("images/hoshikawa.png");

    final header = DrawerHeader(
      child: imageHeader,
    );

    final tileA = ListTile(
      title: const Text("練習: ホーム"),
      onTap: () => context.go("/a"),
    );
    final tileB = ListTile(
      title: const Text("練習: 設定"),
      onTap: () => context.go("/b"),
    );
    final tileC = ListTile(
      title: const Text("試合: ホーム"),
      onTap: () => context.go("/c"),
    );
    final tileD = ListTile(
      title: const Text("試合: 設定"),
      onTap: () => context.go("/d"),
    );

    final list = ListView(
      children: [
        header,
        tileA,
        tileB,
        tileC,
        tileD,
      ],
    );
    return list;
  }
}
