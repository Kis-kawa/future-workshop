import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';
import 'package:markdown_widget/markdown_widget.dart';

class MyHelp extends StatelessWidget {
  const MyHelp({super.key});


    final String text = """
# 柔道タイマーの使い方

*4413 岸川享平 が作成(2024/10/16)*

---


## 画面構成

試合用のタイマーと、練習で使う用のタイマーを2つご用意しています。
それぞれに、設定の画面とタイマー表示の画面があります。
それぞれの画面から、左上のハンバーガーメニュからサイドバーを使用してご遷移ください。
なお、タイマー表示の画面は、ハンバーガーメニュが目立たない様にしています。

その他のページにもサイドバーからご遷移ください。

## プログラムタイマーの設定方法

プログラムタイマーの設定ページは下の画像のような画面です。右側のスライドバーで時間を設定し、使いボタンを押すと、左側にスタックされます。

間違えた場合は、削除のアイコンで取り消せます。また。繰り返し回数は、数字の部分をクリックすることで設定できます。

![画像の説明](images/set-pra.png)

## プログラムタイマーのタイマー画面

プログラムタイマーのタイマー画面は下の画像のような画面です。一番大きな数字はタイマーを示し、左下は何個めか、右下は繰り返された回数を示しています。

下のボタンを押すことでアイコンにあった操作ができます。画像の場合は、右のボタンで再開、左のボタンでリセットできます。

![画像の説明](images/home-pra.png)

## 柔道タイマーの設定方法

柔道タイマーの設定ページは下の画像のような画面です。
タイマーの表示向きに合わせた選手カラーを、クリックすることで選ぶことができます。

他に、それぞれの数字の場所をクリックすることで、試合時間、抑え込み時間、技あり時の抑え込み時間を設定できます。

![画像の説明](images/set-game.png)

## 柔道タイマーのタイマー画面

柔道タイマーのタイマー画面は下の画像のような画面です。右の選手カラーの人が指導をもらうとSと書かれた指導のボタンを押し、技ありを取るとWと書かれたボタンを押します。
また、押さえ込んだ際には、一番端の押さえ込んだ方のボタンを押します。スタートする前の画面において、右下の数字は抑え込み時間、左下は、技あり時の抑え込み時間になります。
始めと待ての進行は、真ん中下のボタンで行います。

また、それぞれのボタンはキーボードに対応しています。
左側は、Sで指導、Aで技ありが増えzで抑え込みが始ります。また、右側は、Dで指導、Fで技ありが増えxで抑え込みが始ります。
スペースで始めと待てを操作できます。

![画像の説明](images/home-game.png)

## コードについて

作成したコードはGitHubでご自由にご覧ください。

[GitHubのリンク](https://github.com/Kis-kawa/future-workshop.git)

---

judotimer 2023~

""";


// **太字** と *斜体* を使うことができます。

// > これは引用です。

// - リストの項目1
// - リストの項目2
//   - ネストされたリスト1
//   - ネストされたリスト2

// 1. 番号付きリストの項目1
// 2. 番号付きリストの項目2



// | 列1 | 列2 | 列3 |
// | --- | --- | --- |
// | データ1 | データ2 | データ3 |
// | データ4 | データ5 | データ6 |


// ```dart
// void main() {
//   runApp(MyApp());
// }
// ```


  @override
  Widget build(BuildContext context) {
    // final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    final md =  MarkdownWidget(
      data: text,
    );

    final body = Center(child: Container(
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
    ),);


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
