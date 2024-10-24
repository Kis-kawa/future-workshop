import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';
import 'package:judotimer/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:markdown_widget/markdown_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHelp extends ConsumerWidget {
  const MyHelp({super.key});


    final String jaText = """
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

![画像の説明](assets/git images/set-pra.png)

## プログラムタイマーのタイマー画面

プログラムタイマーのタイマー画面は下の画像のような画面です。一番大きな数字はタイマーを示し、左下は何個めか、右下は繰り返された回数を示しています。

下のボタンを押すことでアイコンにあった操作ができます。画像の場合は、右のボタンで再開、左のボタンでリセットできます。

![画像の説明](assets/images/home-pra.png)

## 柔道タイマーの設定方法

柔道タイマーの設定ページは下の画像のような画面です。
タイマーの表示向きに合わせた選手カラーを、クリックすることで選ぶことができます。

他に、それぞれの数字の場所をクリックすることで、試合時間、抑え込み時間、技あり時の抑え込み時間を設定できます。

![画像の説明](assets/images/set-game.png)

## 柔道タイマーのタイマー画面

柔道タイマーのタイマー画面は下の画像のような画面です。右の選手カラーの人が指導をもらうとSと書かれた指導のボタンを押し、技ありを取るとWと書かれたボタンを押します。
また、押さえ込んだ際には、一番端の押さえ込んだ方のボタンを押します。スタートする前の画面において、右下の数字は抑え込み時間、左下は、技あり時の抑え込み時間になります。
始めと待ての進行は、真ん中下のボタンで行います。

また、それぞれのボタンはキーボードに対応しています。
左側は、Sで指導、Aで技ありが増えzで抑え込みが始ります。また、右側は、Dで指導、Fで技ありが増えxで抑え込みが始ります。
スペースで始めと待てを操作できます。

![画像の説明](assets/images/home-game.png)

## コードについて

作成したコードはGitHubでご自由にご覧ください。

[GitHubのリンク](https://github.com/Kis-kawa/future-workshop.git)

---

judotimer 2023~

""";


    final String enText = """
# How to use Judo-Timer

*written by Kyohei Kishikawa(2024/10/16)*

---


## Screen composition

This app have a ultra function that is 2 types.
One is timer for matches. other is timer for practice.
And there are 2 pages to setting and display to each timers.

From each screen, please use the sidebar from the hamburger menu on the top left.
Please note that the hamburger menu is not noticeable on the tablet display screen.

Please move to other pages from the sidebar.

## Program Timer Setup Instructions

The setup page for the program timer looks like the image below. You can set the time using the slider on the right, and when you press the "Use" button, it will stack on the left.

If you make a mistake, you can cancel it using the delete icon. You can also set the number of repetitions by clicking on the number section.

![画像の説明](assets/git images/set-pra.png)

## Program Timer Display Screen

The timer display screen for the program timer looks like the image below. The largest number indicates the timer, the bottom left shows which number it is, and the bottom right shows the number of repetitions.

You can perform actions corresponding to the icons by pressing the buttons below. In the case of the image, the right button will resume, and the left button will reset.

![画像の説明](assets/images/home-pra.png)

## Judo Timer Setup Instructions

The setup page for the judo timer looks like the image below. You can select the player color that matches the timer display orientation by clicking on it.

Additionally, you can set the match time, hold time, and hold time during a score by clicking on the respective number locations.

![画像の説明](assets/images/set-game.png)

## Judo Timer Display Screen

The timer display screen for the judo timer looks like the image below. When the player in the right color receives a penalty, they press the button marked "S," and when they score, they press the button marked "W." If they are holding, they will press the button on the far end corresponding to the player holding. In the pre-start screen, the number on the bottom right indicates the hold time, and the number on the left indicates the hold time during a score. The start and stop progress is controlled with the button in the middle bottom.

Each button corresponds to the keyboard as well. On the left side, 'S' indicates a penalty, 'A' increases the score, and 'Z' starts the hold. On the right side, 'D' indicates a penalty, 'F' increases the score, and 'X' starts the hold. The spacebar can be used to control start and stop.

![画像の説明](assets/images/home-game.png)

## About the Code

Feel free to view the code created on GitHub.

[GitHubのリンク](https://github.com/Kis-kawa/future-workshop.git)

---

judotimer 2023~

""";

    final String koText = """
# 유도 타이머 사용 방법

*4413 기시카와 쿄헤이 작성 (2024/10/16)*

---

## 화면 구성

경기용 타이머와 연습용 타이머 두 가지가 있습니다. 각 타이머에는 설정 화면과 타이머 표시 화면이 있습니다. 각 화면에서 왼쪽 상단의 햄버거 메뉴를 통해 사이드바로 이동할 수 있습니다. 타이머 표시 화면에서는 햄버거 메뉴가 눈에 띄지 않도록 처리되었습니다.

다른 페이지도 사이드바에서 이동할 수 있습니다.

## 프로그램 타이머 설정 방법

프로그램 타이머 설정 페이지는 아래 이미지와 같은 화면입니다. 오른쪽 슬라이드바로 시간을 설정한 후 '사용' 버튼을 누르면 왼쪽에 스택됩니다.

실수한 경우 삭제 아이콘으로 취소할 수 있습니다. 또한 반복 횟수는 숫자 부분을 클릭하여 설정할 수 있습니다.

![이미지 설명](assets/git images/set-pra.png)

## 프로그램 타이머 화면

프로그램 타이머 화면은 아래 이미지와 같습니다. 가장 큰 숫자는 타이머를 나타내고, 왼쪽 하단은 몇 번째인지, 오른쪽 하단은 반복된 횟수를 나타냅니다.

하단 버튼을 눌러 아이콘에 맞는 작업을 할 수 있습니다. 이미지의 경우 오른쪽 버튼으로 재개, 왼쪽 버튼으로 리셋할 수 있습니다.

![이미지 설명](assets/images/home-pra.png)

## 유도 타이머 설정 방법

유도 타이머 설정 페이지는 아래 이미지와 같은 화면입니다. 타이머 표시 방향에 맞춰 선수 색상을 클릭하여 선택할 수 있습니다.

또한, 각 숫자 위치를 클릭하여 경기 시간, 굳히기 시간, 기술 유효 시의 굳히기 시간을 설정할 수 있습니다.

![이미지 설명](assets/images/set-game.png)

## 유도 타이머 화면

유도 타이머 화면은 아래 이미지와 같습니다. 오른쪽 선수 색상의 사람이 지도(지적)를 받으면 'S'라고 쓰인 지도의 버튼을 누르고, 기술 유효를 얻으면 'W'라고 쓰인 버튼을 누릅니다.
또한 굳히기 상태일 때는 가장 끝의 굳히기 버튼을 누릅니다. 시작 전 화면에서 오른쪽 하단 숫자는 굳히기 시간, 왼쪽 하단은 기술 유효 시의 굳히기 시간을 나타냅니다.
시작과 '마테'(멈춤)는 가운데 하단 버튼으로 진행합니다.

각 버튼은 키보드로도 조작할 수 있습니다. 왼쪽은 S로 지도, A로 기술 유효가 증가하고, Z로 굳히기가 시작됩니다. 오른쪽은 D로 지도, F로 기술 유효가 증가하고, X로 굳히기가 시작됩니다. 스페이스바로 시작과 마테를 조작할 수 있습니다.

![이미지 설명](assets/images/home-game.png)

## 코드에 대해

작성한 코드는 GitHub에서 자유롭게 볼 수 있습니다.

[GitHub 링크](https://github.com/Kis-kawa/future-workshop.git)

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
  Widget build(BuildContext context, WidgetRef ref) {
    // final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

  final md = MarkdownWidget(
    data: ref.watch(langProvider) == Locale('en') ? enText
        : ref.watch(langProvider) == Locale('ko') ? koText
        : jaText,
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
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(width: 150),
          Text(AppLocalizations.of(context)!.howtouse,style: TextStyle(color: Colors.white, fontFamily: "Zen_Old_Mincho")),
          Spacer(),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 100, 113, 115),
      actions: [
        Image.asset("assets/images/hoshikawa.png"),
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
