// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:judotimer/drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:judotimer/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:segment_display/segment_display.dart';



class PlayerColor extends StatelessWidget {
  final int numcolor;
  const PlayerColor({
    super.key,
    required this.numcolor,
  });

  @override
  Widget build(BuildContext context) {
    "$numcolor";

    Color containerColor;

    if (numcolor == 0) {
      containerColor = Colors.white;
    } else if (numcolor == 1) {
      containerColor = Colors.red;
    } else if (numcolor == 2) {
      containerColor = Colors.blue;
    } else {
      containerColor = Colors.black; // 決めてない
    }

    return Container(
      // width: 50,
      // height: 200,
      color: containerColor,
      margin: const EdgeInsets.all(5),
    );
  }
}


class GameSetting extends ConsumerWidget {
  const GameSetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  final leftContant = Column(
                  children: [
                    const Expanded(flex: 2, child: Text(""),), //適当な穴埋め
                    Expanded(flex: 2,child: Container(
                      alignment: Alignment.bottomCenter,
                      child: const Text(
                            "選手カラー",
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                      ),),
                    const Expanded(flex: 1,child: Text("")), //適当な穴埋め
                    Expanded(flex: 8,child: Container(alignment:Alignment.center, child: const Row(
                      children: [
                        Expanded(flex: 1,child:  Text(""),),//適当な穴埋め
                        Expanded(flex: 3, child: PlayerColor(numcolor: 2),),
                        Expanded(flex: 1,child: Text(""),),//適当な穴埋め
                        Expanded(flex: 3, child: PlayerColor(numcolor: 0),),
                        Expanded(flex: 1,child: Text(""),),//適当な穴埋め
                      ],
                    ),),),
                    const Expanded(flex: 1,child: Text("")), //適当な穴埋め
                  ],
                );

  void showDialog(Widget child) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
          height: 216,
          padding: const EdgeInsets.only(top: 6.0),
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ),
      );
    }

  var matchtime = ref.watch(matchTimeNotifierProvider);
  var osaetime = ref.watch(wazanasiOsaekomiTimeNotifierProvider);
  var wazaaitime = ref.watch(wazaariOsaekomiTimeNotifierProvider);

  final matchDurations = StateProvider<Duration>(
    (ref) {
      return Duration(minutes: matchtime ~/ 60, seconds: matchtime % 60);
    }
  );

  final matchduration = ref.watch(matchDurations);

  var match = GestureDetector(
    onTap: () => showDialog(
      CupertinoTimerPicker(
        mode: CupertinoTimerPickerMode.ms,
        initialTimerDuration: matchduration,
        onTimerDurationChanged: (Duration newDuration) {
          int newMatchTime = newDuration.inSeconds;
          ref.read(matchTimeNotifierProvider.notifier).chMT(newMatchTime);
          ref.read(matchDurations.notifier).state = newDuration;
        },
      ),
    ),
    child: SevenSegmentDisplay(
      value: "${matchduration.inMinutes.remainder(60).toString().padLeft(2, '0')}:${(matchduration.inSeconds.remainder(60)).toString().padLeft(2, '0')}",
      size: 4.0,
      backgroundColor: Colors.transparent,
        segmentStyle: const HexSegmentStyle(
          enabledColor: Color.fromARGB(255, 75, 54, 53),
          disabledColor: Color.fromARGB(255, 242, 232, 243),
          segmentBaseSize: Size(1.5, 6.1),
        ),
    ),
  );


  final lightContantu = Container(
    color: const Color.fromARGB(255, 242, 247, 188),
    margin: const EdgeInsets.fromLTRB(55, 30, 55, 30),
    child:Align(alignment: Alignment.center, child: SizedBox(
        width: 500,
        child: Column(
          children: [
            const Expanded(flex: 1,child: Text(""),),
            Expanded(flex: 1,child: Container(color: Colors.white,child: match,),),
            Expanded(flex: 1,child: Container(color: Colors.black,),),
            Expanded(flex: 1,child: Container(color: Colors.white,),),
            Expanded(flex: 1,child: Container(color: Colors.black,),),
            const Expanded(flex: 1,child: Text(""),),
          ],
        ),
      ),),
    );

  final con = Align(
    alignment: Alignment.center,
    child: Container(
      margin: const EdgeInsets.fromLTRB(100, 40, 100, 40),
      color: Colors.red,
      child: Container(
        margin: const EdgeInsets.fromLTRB(40, 40, 40, 40),
          color: Colors.amber,
          child: Container(color: const Color.fromARGB(255, 172, 177, 145), child: Row(
            children: [
              Expanded(flex: 1, child: leftContant,),
              Expanded(flex: 3, child: Container(child: lightContantu),),
            ],
          ),),
        ),
      ),
  );


  const drawer = Drawer(
    child: SideBar(),
  );

  final appBar = AppBar(
    title: const Text("試合モードの設定"),
    backgroundColor: Colors.red[300],
  );

  final scaffold = Scaffold(
    appBar: appBar,
    body: con,
    drawer: drawer,
    backgroundColor: const Color.fromARGB(255, 76, 86, 87),
  );

    return scaffold;
  }

}
