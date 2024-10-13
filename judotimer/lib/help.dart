import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:judotimer/drawer.dart';
import 'package:markdown/markdown.dart' as md;


class MyHelp extends StatelessWidget {
  const MyHelp({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    final String text = """
      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ
      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして
      2. text用意して
      ３. Markdownのbodyプロパティに突っ込むだけ      # hello world
      1. importして2. text用意して３. Markdownのbodyプロパティに突っ込むだけ1. importして2. text用意して３. Markdownのbodyプロパティに突っ込むだけ1. importして2. text用意して３. Markdownのbodyプロパティに突っ込むだけ1. importして2. text用意して３. Markdownのbodyプロパティに突っ込むだけ1. importして2. text用意して３. Markdownのbodyプロパティに突っ込むだけ
      """;

    final md =  MarkdownBody(selectable: true,data: text);

    final body = SingleChildScrollView(child:Center(child: Container(
      width: deviceWidth*0.6,
      margin: EdgeInsets.fromLTRB(0, 30, 0, 30),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 238, 238, 238),
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(40, 50, 40, 0),
        child: md,
      ),
    ),),);

    final appBar = AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(width: 150),
          Text("使い方",style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
          Spacer(),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 100, 113, 115),
      actions: [
        Image.asset("images/hoshikawa.png"),
        const Text("Judo Timer", style: TextStyle(color: Colors.white, fontFamily: "Dangrek"),),
        const SizedBox(width: 80),
      ],
    );

    const drawer = Drawer(
      backgroundColor: Color.fromARGB(255, 76, 86, 87),
      child: SideBar()
    );

    final scaffold = Scaffold(
    appBar: appBar,
    body: body,
    drawer: drawer,
    backgroundColor: Colors.white,
    // backgroundColor: const Color.fromARGB(255, 223, 219, 219),
    );

    return scaffold;
  }
}
