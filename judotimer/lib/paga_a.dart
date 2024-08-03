import 'dart:async';

import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';
import 'package:segment_display/segment_display.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:judotimer/main.dart';
import 'package:judotimer/page_b.dart';

class PracticeHome extends ConsumerStatefulWidget {
  const PracticeHome({super.key});

  @override
  PracticeHomeState createState() => PracticeHomeState();
}

class PracticeHomeState extends ConsumerState<PracticeHome> {
  Timer? timer;
  int currentIndex = 0;
  int count = 1;
  String currentData = "";
  int currentTime = 0;
  List<TimeCell> models = [];

  @override
  void initState() {
    super.initState();
    models = ref.read(modelsNotifierProvider);
    currentData = ref.read(modelsNotifierProvider)[currentIndex].settime;
    currentTime = int.parse(currentData.substring(0, 2)) * 60 + int.parse(currentData.substring(3, 5));
  }

  @override
  Widget build(BuildContext context) {

    const drawer = Drawer(
      backgroundColor: Color.fromARGB(255, 34, 130, 135),
      child: SideBar(),
    );

    final appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );

    const dur = Duration(seconds: 1);

    void stopTimer() {
      timer?.cancel();
    }

    void startTimer() {
      stopTimer();
      timer = Timer.periodic(dur, (_) {
        if (currentTime > 0) {
          setState(() {
            currentTime -= 1;
          });
        } else {
          if (currentIndex+1 < models.length) {
            setState(() {
              currentIndex++;
              currentData = models[currentIndex].settime;
              currentTime = int.parse(currentData.substring(0, 2)) * 60 + int.parse(currentData.substring(3, 5));
            });
          }
          else if (count < ref.read(repCountNotifierProvider)) {
            setState(() {
              count++;
              currentIndex = 0;
              currentData = models[currentIndex].settime;
              currentTime = int.parse(currentData.substring(0, 2)) * 60 + int.parse(currentData.substring(3, 5));
            });
          }
          else { stopTimer(); }
        }
      });
    }


    var upperLeft = SevenSegmentDisplay(
      value: "${(currentTime ~/ 60).toString().padLeft(2, '0')}:${(currentTime % 60).toString().padLeft(2, '0')}",
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
      value: "${currentIndex+1}",
      size: 15.0,
      backgroundColor: Colors.transparent,
      characterSpacing: 20.0,
      segmentStyle: const HexSegmentStyle(
        enabledColor: Color.fromARGB(255, 242, 232, 243),
        disabledColor: Color.fromARGB(255, 75, 54, 53),
        segmentBaseSize: Size(1.5, 6.1),
      ),
    );
    var underCenter = SevenSegmentDisplay(
      value: "$count",
      size: 15.0,
      backgroundColor: Colors.transparent,
      characterSpacing: 20.0,
      segmentStyle: const HexSegmentStyle(
        enabledColor: Color.fromARGB(255, 255, 0, 0),
        disabledColor: Color.fromARGB(255, 75, 54, 53),
        segmentBaseSize: Size(1.5, 6.1),
      ),
    );

    final backRegion = SizedBox(
      child: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              color: const Color.fromARGB(255, 24, 24, 24),
              padding: const EdgeInsets.fromLTRB(30, 5, 30, 30),
              child: Align(
                child: Container(
                  color: const Color.fromARGB(255, 24, 24, 24),
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
                                Expanded(flex: 4, child: Container(color: const Color.fromARGB(255, 24, 24, 24))),
                                upperLeft,
                                Expanded(flex: 4, child: Container(color: const Color.fromARGB(255, 24, 24, 24))),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(color: const Color.fromARGB(255, 24, 24, 24)),
                        ),
                        Expanded(
                          flex: 9,
                          child: Row(
                            children: [
                              underRight,
                              Expanded(flex: 1, child: Container(color: const Color.fromARGB(255, 24, 24, 24))),
                              underCenter,
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: ref.watch(statePracticeNotifierProvider) == "waiting",
                      child: Container(
                        color: Colors.red,
                        width: 200,
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              ref.read(statePracticeNotifierProvider.notifier).resetting();
                            },
                            icon: const Icon(Icons.restart_alt_rounded, size: 60,),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      color: Colors.amber,
                      width: 200,
                      child: Center(
                        child: IconButton(
                          onPressed: () {
                            ref.watch(statePracticeNotifierProvider) == "previous" || ref.watch(statePracticeNotifierProvider) == "waiting"
                            ? {
                              ref.read(statePracticeNotifierProvider.notifier).working(),
                              startTimer(),
                              }
                            : {
                              ref.read(statePracticeNotifierProvider.notifier).waiting(),
                              stopTimer(),
                              };
                          },
                          icon: ref.watch(statePracticeNotifierProvider) == "previous" || ref.watch(statePracticeNotifierProvider) == "waiting"
                          ? const Icon(Icons.play_circle, size: 60,) : const Icon(Icons.pause, size: 60,),
                        ),
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

    final scaffold = Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      appBar: appBar,
      body: backRegion,
      drawer: drawer,
    );

    return scaffold;
  }
}
