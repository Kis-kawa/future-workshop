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
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.home, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("ホーム", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/a"),
    );

    final tileB = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.settings, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("設定", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/b"),
    );

    final tileC = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.home, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("ホーム", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/c"),
    );

    final tileD = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.settings, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("設定", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/d"),
    );

    final lineA = ListTile(
      title: const Text("プログラムタイマー", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho", fontWeight: FontWeight.w300, fontSize: 19)),
    );

    final lineB = ListTile(
      title: const Text("柔道タイマー", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho", fontWeight: FontWeight.w300, fontSize: 19)),
    );

    final hel = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.help, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("使い方", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/help"),
    );

    final list = ListView(
      children: [
        header,
        lineA,
        tileA,
        tileB,
        Divider(),
        lineB,
        tileC,
        tileD,
        Divider(),
        hel,
      ],
    );
    return list;
  }
}
