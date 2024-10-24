import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:judotimer/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final imageHeader = Image.asset("assets/images/hoshikawa.png");

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

    final lineC = ListTile(
      title: const Text("言語", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho", fontWeight: FontWeight.w300, fontSize: 19)),
    );

    final hel = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.help, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("使い方", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/help"),
    );

    final roul = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.roundabout_left, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("ルーレット", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/roulette"),
    );

    final ja = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.roundabout_left, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("日本語にする", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => ref.read(langProvider.notifier).chja()
    );

    final en = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.roundabout_left, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("英語にする", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => ref.read(langProvider.notifier).chen()
    );

    final ko = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.roundabout_left, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("韓国語にする", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => ref.read(langProvider.notifier).chko()
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
        lineC,
        ja,
        en,
        ko,
        Divider(),
        hel,
        roul,
      ],
    );
    return list;
  }
}
