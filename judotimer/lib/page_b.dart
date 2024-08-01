import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';

class TimeCell {
  // オートナンバ
  final String num;
  // 設定時間
  final String settime;

  // コンストラクタ
  TimeCell(this.num, this.settime,);
}

final models = [
    TimeCell("1", "10:20"),
    TimeCell("2", "20:00"),
    TimeCell("3", "00:20"),
    TimeCell("4", "00:30"),
    TimeCell("5", "00:60"),
    TimeCell("6", "00:20"),
    TimeCell("7", "00:10"),
    TimeCell("8", "00:15"),
];

// モデル => ウィジェット に変換する
Widget modelToWidget(TimeCell model, BuildContext context) {
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
                "${model.num}",
                style: const TextStyle(
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),),
      ),
      const Spacer(),
      Text("${model.settime}", style: const TextStyle(
                  fontSize: 24.0,
                ),
                textAlign: TextAlign.center,
              ),
      const Spacer(),
      const Icon(Icons.restore_from_trash ),
      const Spacer(),
    ],),
  );

  return con;
}

class PracticeSetting extends StatelessWidget {
  const PracticeSetting({super.key});

  @override
  Widget build(BuildContext context) {
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
          ),
        ),
        const SizedBox(width: 80),
      ],
      elevation: 0,
    );

  final list = ListView.builder(
    itemCount: models.length,
    itemBuilder: (c, i) => modelToWidget(models[i], c),
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
                child: const Text("繰り返し回数 x", style: TextStyle(fontSize: 48.0,),),
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
        Container(
          width: deviceWidth * 0.45,
          color: Colors.black,
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
