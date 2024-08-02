import 'package:flutter/material.dart';
import 'package:judotimer/drawer.dart';
import 'package:segment_display/segment_display.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:judotimer/main.dart';

class PracticeHome extends ConsumerWidget {
  const PracticeHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const drawer = Drawer(
      backgroundColor: Color.fromARGB(255, 34, 130, 135),
      child: SideBar(),
    );

    final appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
    );

    const duration = 90;

    const upperLeft = SevenSegmentDisplay(
      value: "$duration:$duration",
      size: 15.0,
      backgroundColor: Colors.transparent,
      characterSpacing: 20.0,
      segmentStyle: HexSegmentStyle(
        enabledColor: Color.fromARGB(255, 242, 232, 243),
        disabledColor: Color.fromARGB(255, 75, 54, 53),
        segmentBaseSize: Size(1.5, 6.1),
      ),
    );
    const underRight = SevenSegmentDisplay(
      value: "$duration",
      size: 15.0,
      backgroundColor: Colors.transparent,
      characterSpacing: 20.0,
      segmentStyle: HexSegmentStyle(
        enabledColor: Color.fromARGB(255, 242, 232, 243),
        disabledColor: Color.fromARGB(255, 75, 54, 53),
        segmentBaseSize: Size(1.5, 6.1),
      ),
    );
    const underLeft = SevenSegmentDisplay(
      value: "$duration",
      size: 15.0,
      backgroundColor: Colors.transparent,
      characterSpacing: 20.0,
      segmentStyle: HexSegmentStyle(
        enabledColor: Color.fromARGB(255, 242, 232, 243),
        disabledColor: Color.fromARGB(255, 75, 54, 53),
        segmentBaseSize: Size(1.5, 6.1),
      ),
    );
    const underCenter = SevenSegmentDisplay(
      value: "$duration",
      size: 15.0,
      backgroundColor: Colors.transparent,
      characterSpacing: 20.0,
      segmentStyle: HexSegmentStyle(
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
                              Expanded(flex: 1, child: Container(color: const Color.fromARGB(255, 24, 24, 24))),
                              underLeft,
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
                            ? ref.read(statePracticeNotifierProvider.notifier).working() : ref.read(statePracticeNotifierProvider.notifier).waiting();
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
