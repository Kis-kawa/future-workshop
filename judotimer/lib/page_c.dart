import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';
import 'package:judotimer/main.dart';
import 'package:segment_display/segment_display.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';


class GameHome extends ConsumerStatefulWidget {
  const GameHome({super.key});

  @override
  GameHomeState createState() => GameHomeState();
}
class GameHomeState extends ConsumerState<GameHome> {
  Timer? timer;
  Timer? timer1;
  Timer? timer2;
  @override
  Widget build(BuildContext context) {

  const drawer = Drawer(
    backgroundColor: Color.fromARGB(255, 196, 66, 71),
    child: SideBar(),
  );

  final appBar = AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
  );

  var matchtime = ref.watch(matchTimeNotifierProvider);
  var osaetime = ref.watch(wazanasiOsaekomiTimeNotifierProvider);
  var wazaaitime = ref.watch(wazaariOsaekomiTimeNotifierProvider);

  var sidouA = ref.watch(player1NotifierProvider);
  var sidouB = ref.watch(player2NotifierProvider);
  var sinkou = ref.watch(stateMatchNotifierProvider);
  const dur = Duration(seconds: 1);

  void stopTimer() {
    timer?.cancel();
  }

  void startTimer() {
    stopTimer();
    timer = Timer.periodic(dur, (_) {
      if (ref.read(matchTimeNotifierProvider)[1] > 0) {
        ref.read(matchTimeNotifierProvider.notifier).disMT();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer1() {
    timer1?.cancel();
  }

  //timer1は左の人の処理
  //左の人が押さえ込んだ時にスタートされる
  void startTimer1() {
    stopTimer1();
    timer1 = Timer.periodic(dur, (_) {
      ref.read(wazanasiOsaekomiTimeNotifierProvider.notifier).disOT();
    });
  }

  void stopTimer2() {
    timer2?.cancel();
  }

  void startTimer2() {
    stopTimer2();
    timer2 = Timer.periodic(dur, (_) {
      // ここで技ありなしの分岐書いてもできない
      ref.read(wazanasiOsaekomiTimeNotifierProvider.notifier).disOT();
    });
  }


  String getDisplayValue1() {
    if (sinkou == "previous") {
      return wazaaitime[1].toString().padLeft(2, '0');
    } else if (sinkou == "osaekomi_1") {
      int diff = osaetime[0] - osaetime[1];
      if (sidouA[0] == 1) {
        if (diff >= wazaaitime[0]) {
          return "${wazaaitime[0]}";
        } else {
          return diff.toString();
        }
      } else if (sidouA[0] == 0) {
        if (diff >= osaetime[0]) {
          return "${osaetime[0]}";
        } else {
          return diff.toString();
        }
      }
    }
    return "00";
  }

  String getDisplayValue2() {
    if (sinkou == "previous") {
      return osaetime[0].toString().padLeft(2, '0');
    } else if (sinkou == "osaekomi_2") {
      int diff = osaetime[0] - osaetime[1];
      if (sidouB[0] == 1) {
        if (diff >= wazaaitime[0]) {
          return "${wazaaitime[0]}";
        } else {
          return diff.toString();
        }
      } else if (sidouB[0] == 0) {
        if (diff >= osaetime[0]) {
          return "${osaetime[0]}";
        } else {
          return diff.toString();
        }
      }
    }
    return "00";
  }


  var upper = SevenSegmentDisplay(
                    value: "${(matchtime[1] ~/ 60).toString().padLeft(2, '0')}:${(matchtime[1] % 60).toString().padLeft(2, '0')}",
                    size: 15.0,
                    backgroundColor: Colors.transparent,
                    characterSpacing: 20.0,
                      segmentStyle: const HexSegmentStyle(
                        enabledColor: Color.fromARGB(255, 242, 232, 243),
                        disabledColor: Color.fromARGB(255, 75, 54, 53),
                        segmentBaseSize: Size(1.5, 6.1),
                      ),
                  );
  var underRight = SevenSegmentDisplay(
                    value: getDisplayValue2(),
                    // value: osaetime[1].toString().padLeft(2, '0'),
                    size: 15.0,
                    backgroundColor: Colors.transparent,
                    characterSpacing: 20.0,
                      segmentStyle: const HexSegmentStyle(
                        enabledColor: Color.fromARGB(255, 242, 232, 243),
                        disabledColor: Color.fromARGB(255, 75, 54, 53),
                        segmentBaseSize: Size(1.5, 6.1),
                      ),
                  );
  var underLeft = SevenSegmentDisplay(
                    value: getDisplayValue1(),
                    // value: wazaaitime[1].toString().padLeft(2, '0'),
                    size: 15.0,
                    backgroundColor: Colors.transparent,
                    characterSpacing: 20.0,
                      segmentStyle: const HexSegmentStyle(
                        enabledColor: Color.fromARGB(255, 242, 232, 243),
                        disabledColor: Color.fromARGB(255, 75, 54, 53),
                        segmentBaseSize: Size(1.5, 6.1),
                      ),
                  );
  const underCenter = SevenSegmentDisplay(
                    value: "00",
                    size: 15.0,
                    backgroundColor: Colors.transparent,
                    characterSpacing: 20.0,
                      segmentStyle: HexSegmentStyle(
                        enabledColor: Color.fromARGB(255, 255, 0, 0),
                        disabledColor: Color.fromARGB(255, 75, 54, 53),
                        segmentBaseSize: Size(1.5, 6.1),
                      ),
                  );



  var a1Sidou = ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(90, 90),
      backgroundColor: (sidouA[1] >= 1) ? Colors.amber : Colors.white,
      foregroundColor: Colors.black,
      shape: const CircleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    ),
    onPressed: () {
      if(sinkou == "working" || sinkou == "waiting"){
        if(sidouA[1] > 0) {ref.read(player1NotifierProvider.notifier).nosidou();}
        else {ref.read(player1NotifierProvider.notifier).sidou();}
      }
    },
    child: Center(child: Text(sidouA[1].toString()),)
  );

  var a2Sidou = ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(90, 90),
      backgroundColor: (sidouA[1] == 2) ? Colors.amber : Colors.white,
      foregroundColor: Colors.black,
      shape: const CircleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    ),
    onPressed: () {
      if(sinkou == "working" || sinkou == "waiting"){
        if(sidouA[1] > 1) {ref.read(player1NotifierProvider.notifier).nosidou();}
        else {ref.read(player1NotifierProvider.notifier).sidou();}
      }
    },
    child: Center(child: Text(sidouA[1].toString()),)
  );

  var b1Sidou = ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(90, 90),
      backgroundColor: (sidouB[1] >= 1) ? Colors.amber : Colors.white,
      foregroundColor: Colors.black,
      shape: const CircleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    ),
    onPressed: () {
      if(sinkou == "working" || sinkou == "waiting"){
        if(sidouB[1] > 0) {ref.read(player2NotifierProvider.notifier).nosidou();}
        else {ref.read(player2NotifierProvider.notifier).sidou();}
      }
    },
    child: Center(child: Text(sidouB[1].toString()),)
  );

  var b2Sidou = ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(90, 90),
      backgroundColor: (sidouB[1] == 2) ? Colors.amber : Colors.white,
      foregroundColor: Colors.black,
      shape: const CircleBorder(
        side: BorderSide(
          color: Colors.black,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
    ),
    onPressed: () {
      if(sinkou == "working" || sinkou == "waiting"){
        if(sidouB[1] > 1) {ref.read(player2NotifierProvider.notifier).nosidou();}
        else {ref.read(player2NotifierProvider.notifier).sidou();}
      }
    },
    child: Center(child: Text(sidouB[1].toString()),)
  );



  var oneOsae = ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(0, 65),
      backgroundColor: (sinkou == "osaekomi_1") ? Colors.amber : Colors.white,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () {
      if(sinkou == "osaekomi_1") {
        ref.read(stateMatchNotifierProvider.notifier).working();
        stopTimer1();
        }
      else if(sinkou == "working")  {
        ref.read(stateMatchNotifierProvider.notifier).osaekomi_1();
        startTimer1();
        }
    },
    child: Center(child: Text(sinkou.toString()),)
  );

  var twoOsae = ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(0, 65),
      backgroundColor: (sinkou == "osaekomi_2") ? Colors.amber : Colors.white,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () {
      if(sinkou == "osaekomi_2") {
        ref.read(stateMatchNotifierProvider.notifier).working();
        stopTimer2();
        }
      else if(sinkou == "working")  {
        startTimer2();
        ref.read(stateMatchNotifierProvider.notifier).osaekomi_2();
        }
    },
    child: Center(child: Text(sinkou.toString()),)
  );


  var oneWaza = ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(0, 70),
      backgroundColor: (sidouA[0] == 1) ? Colors.amber : Colors.white,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () {
      if(sinkou != "previous"){
        if(sidouA[0] == 1) {ref.read(player1NotifierProvider.notifier).nowazaari();}
        else {ref.read(player1NotifierProvider.notifier).wazaari();}
      }
    },
    child: Center(child: Text(sidouA[0].toString()),),
  );

  var twoWaza = ElevatedButton(
    style: ElevatedButton.styleFrom(
      fixedSize: const Size(0, 70),
      backgroundColor: (sidouB[0] == 1) ? Colors.amber : Colors.white,
      foregroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
    onPressed: () {
      if(sinkou != "previous"){
        if(sidouB[0] == 1) {ref.read(player2NotifierProvider.notifier).nowazaari();}
        else {ref.read(player2NotifierProvider.notifier).wazaari();}
      }
    },
    child: Center(child: Text(sidouB[0].toString()),),
  );


  var hazime = Ink(
    decoration: const ShapeDecoration(
      color: Colors.transparent,
      shape: CircleBorder(),
    ),
    child: IconButton(
      onPressed: () {
        if (sinkou == "previous" || sinkou == "waiting") {
          ref.read(stateMatchNotifierProvider.notifier).working();
          startTimer();
          ref.read(wazanasiOsaekomiTimeNotifierProvider.notifier).init();
        } else {
          ref.read(stateMatchNotifierProvider.notifier).waiting();
          stopTimer();
          stopTimer1();
          stopTimer2();
        }
      },
      icon: sinkou == "previous"
          ? const Icon(Icons.play_circle, size: 60)
          : sinkou == "waiting"
              ? const Icon(Icons.play_circle, size: 60)
              : const Icon(Icons.pause, size: 60),
    ),
  );



  final backRegion = SizedBox(
    child: Column(
      children: [
        Expanded(
          flex: 9,
          child: Container(
            color: Colors.transparent,
            padding: const EdgeInsets.fromLTRB(30, 5, 30, 30),
            child: Align(
              child: Container(
                color: Colors.transparent,
                child: AspectRatio(
                  aspectRatio: 1721 / 940,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(color: Colors.transparent),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.topRight,
                                              color: Colors.transparent,
                                              padding: const EdgeInsets.fromLTRB(0, 5, 20, 0),
                                              child: const Text(
                                                "S",
                                                style: TextStyle(
                                                  fontSize: 70,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Expanded(flex: 1, child: a1Sidou),
                                                Expanded(flex: 1, child: a2Sidou),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(flex: 13, child: Center(child: upper)),
                              Expanded(
                                flex: 4,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(color: Colors.transparent),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Column(
                                              children: [
                                                Expanded(flex: 1, child: b1Sidou),
                                                Expanded(flex: 1, child: b2Sidou),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              alignment: Alignment.topLeft,
                                              color: Colors.transparent,
                                              padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                                              child: const Text(
                                                "S",
                                                style: TextStyle(
                                                  fontSize: 70,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 1, child: Container(color: Colors.transparent)),
                            Expanded(flex: 10, child: Container(color: Colors.white)),
                            Expanded(flex: 18, child: Container(color: Colors.transparent)),
                            Expanded(flex: 10, child: Container(color: Colors.blueAccent)),
                            Expanded(flex: 1, child: Container(color: Colors.transparent)),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 9,
                        child: Row(
                          children: [
                            Expanded(flex: 5, child: Center(child: underLeft)),
                            Expanded(flex: 1, child: Container(color: Colors.transparent)),
                            const Expanded(flex: 5, child: Center(child: underCenter)),
                            Expanded(flex: 1, child: Container(color: Colors.transparent)),
                            Expanded(flex: 5, child: Center(child: underRight)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            color: const Color.fromARGB(255, 76, 86, 87),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(flex: 4, child: oneOsae),
                        const Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              "W",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 3, child: oneWaza),
                      ],
                    ),
                  ),
                  Expanded(flex: 2, child: Container(color: const Color.fromARGB(255, 76, 86, 87))),
                  Expanded(flex: 3, child: Container(color: Colors.amber, child: hazime)),
                  Expanded(flex: 2, child: Container(color: const Color.fromARGB(255, 76, 86, 87))),
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Expanded(flex: 3, child: twoWaza),
                        const Expanded(
                          flex: 2,
                          child: Center(
                            child: Text(
                              "W",
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(flex: 4, child: twoOsae),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ),
  );


  Color backgroundColor;

  if (sinkou == "waiting") {
    backgroundColor = const Color.fromARGB(255, 109, 104, 56);
  } else if (sinkou == "osaekomi_1" || sinkou == "osaekomi_2") {
    backgroundColor = const Color.fromARGB(255, 15, 59, 109);
  } else {
    backgroundColor = const Color.fromARGB(255, 24, 24, 24);
  }

  final scaffold = Scaffold(
    backgroundColor: backgroundColor,
    appBar: appBar,
    body: backRegion,
    drawer: drawer,
  );
    return scaffold;
  }
}
