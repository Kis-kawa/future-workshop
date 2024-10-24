import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:judotimer/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideBar extends ConsumerWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context,  WidgetRef ref) {
    final imageHeader = Image.asset("assets/images/hoshikawa.png");

    final header = DrawerHeader(
      child: imageHeader,
    );

    final tileA = ListTile(
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.home, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        Text(AppLocalizations.of(context)!.home, style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/a"),
    );

    final tileB = ListTile(
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.settings, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        Text(AppLocalizations.of(context)!.setting, style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/b"),
    );

    final tileC = ListTile(
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.home, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        Text(AppLocalizations.of(context)!.home, style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/c"),
    );

    final tileD = ListTile(
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.settings, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        Text(AppLocalizations.of(context)!.setting, style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/d"),
    );

    final lineA = ListTile(
      title: Text(AppLocalizations.of(context)!.programtimer, style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho", fontWeight: FontWeight.w300, fontSize: 19)),
    );

    final lineB = ListTile(
      title: Text(AppLocalizations.of(context)!.judotimer, style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho", fontWeight: FontWeight.w300, fontSize: 19)),
    );

    final lineC = ListTile(
      title: Text(AppLocalizations.of(context)!.language, style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho", fontWeight: FontWeight.w300, fontSize: 19)),
    );

    final hel = ListTile(
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.help, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        Text(AppLocalizations.of(context)!.howtouse, style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/help"),
    );

    final roul = ListTile(
      title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.roundabout_left, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        Text(AppLocalizations.of(context)!.roulette, style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => context.go("/roulette"),
    );

    final ja = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.roundabout_left, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("日本語", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => ref.read(langProvider.notifier).chja()
    );

    final en = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.roundabout_left, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("english", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
      ],),
      onTap: () => ref.read(langProvider.notifier).chen()
    );

    final ko = ListTile(
      title: const Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Icon(Icons.roundabout_left, size: 25, color: Colors.white,),
        SizedBox(width: 10,),
        const Text("한국", style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
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
