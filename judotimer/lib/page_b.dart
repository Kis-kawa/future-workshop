import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:judotimer/main.dart';
import 'package:flutter/cupertino.dart';


class TimeCell {
  // オートナンバ笑
  final String num;
  // 設定時間
  final String settime;

  // コンストラクタ
  TimeCell(this.num, this.settime,);
}


// モデル => ウィジェット に変換する
Widget modelToWidget(TimeCell model, BuildContext context, int id, WidgetRef ref) {
  final double deviceHeight = MediaQuery.of(context).size.height;

  final con = Container(
    padding: const EdgeInsets.all(1),
    decoration: const BoxDecoration(
      border: Border(
        top: BorderSide(color: Color.fromARGB(255, 118, 118, 118), width: 3.0),
        right: BorderSide(color: Color.fromARGB(255, 213, 217, 194), width: 10.0),
        bottom: BorderSide(color: Color.fromARGB(255, 118, 118, 118), width: 3.0),
        left: BorderSide(color: Color.fromARGB(255, 213, 217, 194), width: 10.0),
      ),
      color: Color.fromARGB(255, 202, 202, 202),
    ),
    height: ((deviceHeight*0.8)*0.82)*0.17,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      const Spacer(),
      Container(
        width: ((deviceHeight*0.8)*0.82)*0.17*0.65,
        height: ((deviceHeight*0.8)*0.82)*0.17*0.65,
        color: Colors.white,
        child: Center(child: Text(
                "$id",
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),),
      ),
      const Spacer(),
      Text("$model.settime", style: const TextStyle(
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
      const Spacer(),
      IconButton(
        icon: const Icon(Icons.restore_from_trash),
        onPressed: () {
          ref.read(modelsNotifierProvider.notifier).delete(id-1);
        },
      ),
      const Spacer(),
    ],),
  );

  return con;
}

class PracticeSetting extends ConsumerWidget {
  const PracticeSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    const drawer = Drawer(
      backgroundColor: Color.fromARGB(255, 34, 130, 135),
      child: SideBar(),
    );

    final appBar = AppBar(
      backgroundColor: const Color.fromARGB(255, 34, 130, 135),
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          SizedBox(width: 150),
          Text(
            "練習の設定",
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Zen_Old_Mincho",
            ),
          ),
          Spacer(),
        ],
      ),
      actions: [
        Image.asset("images/hoshikawa.png"),
        const Text(
          "Judo Timer",
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Dangrek",
          ),
        ),
        const SizedBox(width: 80),
      ],
      elevation: 0,
    );

    final models = ref.watch(modelsNotifierProvider);

    final list = ListView.builder(
      itemCount: models.length,
      itemBuilder: (c, i) => modelToWidget(models[i], c, i+1, ref),
    );

    final slidermin = ref.watch(setMinuteNotifierProvider);
    final slidersec = ref.watch(setSecondNotifierProvider);

    final barminch = Slider(
      value: slidermin,
      min: 0, max: 59,
      divisions: 59,
      onChanged: (newValue) {ref.read(setMinuteNotifierProvider.notifier).updatemin(newValue);},
    );

    final barmin = SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color.fromARGB(255, 34, 130, 135), // 適用されてる領域
              inactiveTrackColor: Colors.grey, // 適用されていない領域
              trackHeight: 11.0, // スライダーの幅
              thumbColor: Colors.white, // つまみの色
              overlayColor: const Color.fromARGB(125, 193, 193, 193), // つまみを掴んだ時に広がる領域の色
              thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 15.0), // つまみの大きさ
              overlayShape: const RoundSliderOverlayShape(
                  overlayRadius: 20.0), // つまみを掴んだ時に広がる領域の大きさ
            ),
            child: barminch,
    );

    final barsecch = Slider(
      value: slidersec,
      min: 0, max: 59,
      divisions: 59,
      onChanged: (newValue) {ref.read(setSecondNotifierProvider.notifier).updatesec(newValue);},
    );

    final barsec = SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color.fromARGB(255, 34, 130, 135),
              inactiveTrackColor: Colors.grey,
              trackHeight: 11.0,
              thumbColor: Colors.white,
              overlayColor: const Color.fromARGB(125, 193, 193, 193),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
              overlayShape: const RoundSliderOverlayShape(overlayRadius: 20.0),
            ),
            child: barsecch,
    );

    final fitbotton = ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                ),
                onPressed: () {ref.read(modelsNotifierProvider.notifier).add("1", "${slidermin.toString().padLeft(2, '0')}:${slidersec.toString().padLeft(2, '0')}");},
                child: const Text(
                  '追加ボタン',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: "Noto_Sans_JP",
                    ),
                ),
              );

    int repeatCount = 8;

    final repcount = GestureDetector(
      onTap: () => showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            color: CupertinoColors.systemBackground.resolveFrom(context),
            child: CupertinoPicker(
              itemExtent: 32.0,
              onSelectedItemChanged: (int num) {
                repeatCount = num;
              },
              children: List.generate(60, (index) => Text('$index 回')),
            ),
          );
        },
      ),
      child: Text(
        '$repeatCount',
        style: const TextStyle(fontSize: 48),
      ),
    );

    final backRegion = SizedBox(
      width: deviceWidth * 0.9,
      height: deviceHeight * 0.8,
      child: Row(children: [
        Container(
          width: deviceWidth * 0.45,
          color: Colors.transparent,
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomCenter,
                height: (deviceHeight*0.8)*0.18,
                color: Colors.transparent,
                padding: const EdgeInsets.all(5),
                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("繰り返し回数 ", style: TextStyle(fontSize: 38.0, fontFamily: "Noto_Sans_JP"),),
                  const SizedBox(width: 4,),
                  repcount,
                ],)
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: (deviceHeight*0.8)*0.82,
                width: (deviceWidth*0.4)*0.7,
                color: Colors.transparent,
                padding: const EdgeInsets.all(30),
                child: list,
              ),
            ],
          ),
        ),
        SizedBox(
          width: deviceWidth * 0.45,
          child: Column(
            children: [
              Container(height: (deviceHeight * 0.8)*0.3, color: Colors.transparent, alignment: Alignment.bottomCenter,padding: const EdgeInsets.all(20) ,child: Text("${slidermin.toString().padLeft(2, '0')}:${slidersec.toString().padLeft(2, '0')}", style: const TextStyle(fontSize: 120, fontFamily: "Dangrek"),),),
              Container(height: (deviceHeight * 0.8)*0.2, color: Colors.transparent, child: barmin,),
              Container(height: (deviceHeight * 0.8)*0.05, color: Colors.transparent, child: barsec,),
              Container(height: (deviceHeight * 0.8)*0.15, color: Colors.transparent,),
              SizedBox(height: (deviceHeight * 0.8)*0.2, width: deviceWidth * 0.45*0.7 ,child: fitbotton),
            ],
          ),
        ),
      ],),
    );

    final scaffold = Scaffold(
      backgroundColor: const Color.fromARGB(255, 213, 217, 194),
      appBar: appBar,
      body: Center(child: backRegion,),
      drawer: drawer,
    );

    return scaffold;
  }
}
